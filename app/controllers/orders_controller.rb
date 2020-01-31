class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(product: @product, user: current_user)
    @order.price = @product.price
    if @order.save
      redirect_to products_path, notice: 'orden ingresada'
    else
      redirect_to products_path, alert: 'orden no ingresada'
    end
  end

  def index
    @orders = current_user.orders
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: 'orden eliminada'
    end
end
