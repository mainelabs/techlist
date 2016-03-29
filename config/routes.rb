Rails.application.routes.draw do
  namespace :admin do
    resources :places
    resources :place_updates
    resources :users

    root to: "places#index"
  end

  root 'home#index'

  devise_for :users

  resources :places, only: [:new, :create, :edit, :update, :index, :show]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :places, only: [:index, :show]
      resources :kinds, only: [:index]
    end
  end

  get '*path', to: 'places#index'
end
