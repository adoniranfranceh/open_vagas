require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  root 'home#index'
  resources :companies 

  resources :positions do 
    resources :applicants
  end

  get '/vaga/:slug', action: :public_position, controller: :positions, as: :public_position
end
