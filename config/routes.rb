Rails.application.routes.draw do
  get 'users/top'
  get 'books/top'
  # get 'homes/top'
  # root to: 'users#top'
   devise_for :users
root :to => "homes#top"
resources :books_image, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
