Rails.application.routes.draw do

  # get 'dashboard/index'
  root 'dashboard#index'
  namespace :api do
    resources :books
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
