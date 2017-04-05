Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :loans, :books
  # get 'dashboard/index'
  # root 'dashboard#index'

  devise_scope :user do
    authenticated :user do
      root to: 'loans#new', as: :user_index
    end

    unauthenticated  :user do
      root to: 'dashboard#index', as: :unauthenticated_root
    end
end


  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :destroy, :update] do
        get :search, on: :collection
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
