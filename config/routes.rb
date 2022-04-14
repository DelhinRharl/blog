Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only:[:index , :show ,:create ,:new, :destroy ] do
      resources :comments, only: [:create , :new , :destroy]
      resources :likes, only: [:create]
    end
  end
end
