Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
    root  'static_pages#home'
   # get   'sessions/new'
   # get   'users/new'
    get   '/index',     to: 'microposts#index'
    get   'tags/:game', to: 'microposts#index', as: :tag
    get   '/tags',      to: 'microposts#tags'
    get   '/microposts',to: 'microposts#show'
    get   '/help',      to: 'static_pages#help'
    get   '/about',     to: 'static_pages#about'
    get   '/contact',   to: 'static_pages#contact'
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
