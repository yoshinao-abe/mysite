Rails.application.routes.draw do
    root  'static_pages#home'
    get 'password_resets/new'
    get 'password_resets/edit'
   # get   'sessions/new'
   # get   'users/new'
    get   '/home',      to: 'static_pages#home'
    get   '/index',     to: 'microposts#tagindex'
    get   'tags/:tag',  to: 'microposts#index', as: :tag
    get   '/tags',      to: 'microposts#tags'
    get   '/microposts',to: 'microposts#show'
    get   '/about',     to: 'static_pages#about'
    get   '/sign',      to: 'static_pages#signup'
    get   '/signup',    to: 'users#new'
    post  '/signup',    to: 'users#create'
    get   '/login',     to: 'sessions#new'
    post  '/login',     to: 'sessions#create'
    delete   '/logout',   to: 'sessions#destroy'
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    resources :microposts,          only: [:create, :destroy, :show] do
      resources :likes, only: [:create, :destroy]
    end
    resources :relationships,       only: [:create, :destroy]
end
