Rails.application.routes.draw do
  root 'places#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :places, only: [:create, :index]
    end
  end
end
