Rails.application.routes.draw do
  get "/forms", to: "forms#index"



  resources :reminders
  resources :documents, except: [:new, :create]

  resources :dependents do
    resources :documents, only: [:new, :create, :index, :show, :edit, :update, :destroy]


  end
  root "dashboard#greetings"

  devise_for :users
  get "/:username" => "users#show", as: :user

end
