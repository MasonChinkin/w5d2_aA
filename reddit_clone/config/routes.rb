Rails.application.routes.draw do
  resources :users
  resource :session, only: [:create, :new, :destroy]
  resources :comments, only: [:create, :edit, :destroy]

  resources :posts, except: [:new] do
    resources :comments, only: [:new]
  end

  resources :subs do
    resources :posts, only: [:new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
