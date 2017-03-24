Rails.application.routes.draw do

  devise_for :users
  # get 'dashboard/index'
  root 'dashboard#index'
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :destroy, :update] do
        get :search, on: :collection
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
