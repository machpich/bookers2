Rails.application.routes.draw do
  devise_for :users

  root "books#start"
  get "/books/about" => "books#about"
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
