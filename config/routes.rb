Rails.application.routes.draw do
  root "books#start"
  get "/books/about" => "books#about"
  devise_for :users
  get "/users/allusers" => "users#allusers",as: "allusers"
  resources :users, only: [:show, :edit, :create, :update]
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
