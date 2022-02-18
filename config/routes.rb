Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :movies, only: [:index, :show]
  resources :lists, only: [:show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
