Rails.application.routes.draw do
  get 'forms/index'


  get '/forms', to: 'forms#index'


  resources :reminders
  resources :documents
  resources :dependents
  root "dashboard#greetings"



  devise_for :users
  get "/:username" => "users#show", as: :user

  # get "/your_first_screen" => "pages#first"

end
