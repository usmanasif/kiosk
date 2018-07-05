Rails.application.routes.draw do
  resources :orders, only: [:show, :new, :create] do
    member do
      post :confirm_order
    end
  end

  resources :employees, only: [] do
    collection do
      get :dashboard
      post 'complete_order/:order_id', action: :complete_order, as: :complete_order
    end
  end

  root 'static_pages#splash'
end
