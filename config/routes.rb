Rails.application.routes.draw do
  root to:  "homes#top"
  get 'home/about' => "homes#about", as: 'about'
  # get 'homes/top'
  # root to: 'users#top'
   devise_for :users
  # get 'books/new'
  # post 'book' => 'books#create'

# resources :books_image, only: [:new, :create, :index, :show]
resources :users
resources :books
delete 'books/:id' => 'books#destroy', as: 'destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
