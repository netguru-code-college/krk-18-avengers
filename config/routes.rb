Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :show, :create, :new] do
    resources :products
  end
  root 'main_screen#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
