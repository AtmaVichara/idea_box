Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :users, only: [:new, :create, :show] do
    resources :ideas, except: [:index]
  end

  resources :ideas, only: [:index, :show]

  namespace :admin do
    resources :categories
    resources :images, only: [:index, :create, :new, :destroy, :show]
  end

  resources :categories, only: [:index, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
