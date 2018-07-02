Rails.application.routes.draw do
  resources :orders, only: [:show, :new, :create] do
    member do
      post :confirm_order
    end
  end

  root 'static_pages#splash'
end
