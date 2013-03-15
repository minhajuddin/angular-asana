AngularAsana::Application.routes.draw do
  root to: "home#index"
  resources :tasks
end
