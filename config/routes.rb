# frozen_string_literal: true

Rails.application.routes.draw do
  root 'plans#index'

  devise_for :users

  resources :users, shallow: true do
    resources :subscriptions do
      resources :transaction_tables
    end
  end

  resources :plans, shallow: true do
    resources :features do
      resources :usages
    end
  end
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
