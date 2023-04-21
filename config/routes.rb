Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :applicants, :companies, :positions
  get '/vaga/:slug', action: :public_position, controller: :positions, as: :public_position
end
