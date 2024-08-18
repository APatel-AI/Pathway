# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#home'

  get '/dashboard', to: 'dashboard#dashboard'
  get '/landing', to: 'dashboard#greetings'
  get '/forms', to: 'forms#index'
  mount Blazer::Engine, at: 'blazer'

  resources :reminders
  resources :documents, except: %i[new create]

  resources :dependents do
    resources :documents, only: %i[new create index show edit update destroy]
  end

  devise_for :users
  get '/:username' => 'users#show', as: :user
end
