Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :places, only: [:new, :create, :edit, :update, :index, :show]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :places, only: [:index, :show]
      resources :kinds, only: [:index]
    end
  end

  match '/404', to: 'errors#not_found', code: 404, via: :all
end
