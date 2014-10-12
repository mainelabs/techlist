Rails.application.routes.draw do
  root 'places#index'

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :places, only: [:new, :create, :edit, :update]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :places, only: [:index, :show]
      resources :kinds, only: [:index]
    end
  end

  get '*path', to: 'places#index'
end
