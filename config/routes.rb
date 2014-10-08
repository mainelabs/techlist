Rails.application.routes.draw do
  root 'places#index'

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :places, only: [:new, :create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :places, only: [:create, :index]
      resources :kinds, only: [:index]
    end
  end

  get '*path', to: 'places#index'
end
