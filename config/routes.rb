Rails.application.routes.draw do
devise_for :users

root "homes#top"
get 'home/about' => 'homes#about'
resources :users,only: [:edit, :show, :destroy, :index, :update]
resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end