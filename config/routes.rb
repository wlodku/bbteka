Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :loans, :books, :users, :grades
  # get 'dashboard/index'
  # root 'dashboard#index'

  devise_scope :user do
    authenticated :user do
      root to: 'loans#new', as: :user_index
      get 'import' => 'users#import', :as => 'import'
      post 'upload' => 'users#upload', :as => 'upload'
      post 'import_create' => 'users#import_create', :as => 'import_create'
    end

    unauthenticated  :user do
      root to: 'dashboard#index', as: :unauthenticated_root
      get 'users/new' => 'user#new', :as => 'create_user'
    end
end


  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :destroy, :update] do
        get :search, on: :collection
        # get :qwe, on: :collection
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
