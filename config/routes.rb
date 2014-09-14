Bloccit::Application.routes.draw do
  
  devise_for :users
  resources :users
  
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'topics#index', as: 'authenticated_root'
  end

  root to: 'welcome#index'

end
