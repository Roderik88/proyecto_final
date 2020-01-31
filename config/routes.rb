Rails.application.routes.draw do
  get 'orders/create'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        
        omniauth_callbacks: "users/omniauth_callbacks"
      }
  resources :products do
    resources :orders, only: :create
  end

  resources :orders

  get 'pages/index'
  get 'pages/contact'

  root to: 'pages#index'

  resources :billings, only: [] do
    collection do
      get 'pre_pay'
      get 'execute'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
