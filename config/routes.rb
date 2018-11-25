# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :show, :create, :new] do
    resources :products, only: [:show, :new, :create] do
      get 'pay_bill'
    end
  end
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
