Rails.application.routes.draw do
  get 'homes/about' => "homes#about", as: 'about'
  # get 'homes/top'
  # root to: 'users#top'
   devise_for :users
root :to => "homes#top"

# resources :books_image, only: [:new, :create, :index, :show]
resources :users, only: [:show, :index, :edit]
resources :books, only: [:show, :index, :edit]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
