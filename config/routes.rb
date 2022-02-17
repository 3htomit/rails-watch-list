Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show]
  resources :lists, only: [:index, :show, :new, :create, :destroy]
  resources :bookmarks, only: [:new, :create, :destroy]
end
