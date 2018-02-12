Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "session#destroy"

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:create, :new, :show, :destroy, :update, :edit]
  end

  resources :categories, only: [:index, :show]
end
