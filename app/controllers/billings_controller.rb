class BillingsController < ApplicationController

    def pre_pay
      orders = current_user.orders.where(payed: false)
        total = orders.pluck("price * 1").sum()
        items = orders.map do |order|
        item = {}
        item[:name] = order.product.name
        item[:sku] = order.id.to_s
        item[:price] = order.price.to_s
        item[:currency] = 'MXN'
        item[:quantity] = 1
        item
        end
        # Build Payment object
    @payment = PayPal::SDK::REST::Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },
      :redirect_urls => {
        :return_url => "http://localhost:3000/billings/execute",
        :cancel_url => "http://localhost:3000/" },
      :transactions =>  [{
        :item_list => {
          :items => items
          },
        :amount =>  {
          :total =>  total,
          :currency =>  "MXN" },
        :description =>  "Carro de compra" }]})

        if @payment.create
          redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
            redirect_to redirect_url
          else
            render json: payment.error
          end
    end

    def execute
         paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
       if paypal_payment.execute(payer_id: params[:PayerID])
         amount = paypal_payment.transactions.first.amount.total
         billing = Billing.create(
           user: current_user,
           code: paypal_payment.id,
           payment_method: 'paypal',
           amount: amount,
           currency: 'MXN'
         )
         orders = current_user.orders.where(payed: false)
         orders.update_all(payed: true, billing_id: billing.id)
         redirect_to root_path, notice: "La compra se realizo con exito"
       else
         render plain; "no se pudo generar el cobro en Paypal"
       end
     end
end
