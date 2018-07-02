Rails.application.routes.draw do
  resources :orders, only: [:show, :new, :create]

  root 'static_pages#splash'
end
