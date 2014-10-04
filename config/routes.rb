Rails.application.routes.draw do
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :places, only: [:create, :index]
      resources :kinds, only: [:index]
    end
  end
  get '*path', to: 'home#index'
end
