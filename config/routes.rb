Rails.application.routes.draw do
  get '/' => "home#top"
  get '/about' => "home#about"

  devise_for :users
  get "/users/allusers" => "users#allusers",as: "allusers"
  resources :users, only: [:show, :edit, :create, :update]
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
