Rails.application.routes.draw do
  devise_for :users
  resources :posts

  root 'main_screen#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
