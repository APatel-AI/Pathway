Rails.application.routes.draw do
  root "dashboard#home"

  get "/dashboard", to: "dashboard#dashboard"
  get "/landing", to: "dashboard#greetings"
  get "/forms", to: "forms#index"
  mount Blazer::Engine, at: "blazer"


  resources :reminders
  resources :documents, except: [:new, :create]

  resources :dependents do
    resources :documents, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  devise_for :users
  get "/:username" => "users#show", as: :user
end
