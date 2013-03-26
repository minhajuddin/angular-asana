AngularAsana::Application.routes.draw do
  root to: "home#index"

  resources :tasks
  resources :session, only: [:new, :create, :destroy]
end
