Rails.application.routes.draw do
  get "/forms", to: "forms#index"



  resources :reminders
  resources :documents
  resources :dependents do
    resources :documents, only: [:new, :create]


  end
  root "dashboard#greetings"

  devise_for :users
  get "/:username" => "users#show", as: :user

end
