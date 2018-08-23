Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :reviews
    resources :tweets
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
