Rails.application.routes.draw do
 
  
  root to: "posts#index"
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
    
  end
  get 'comments/index'
  get 'posts/index'
  
 
 

  resources :posts do
    member do
      get 'current_user_id'
      get 'rhythm'
      get 'public'
      get 'private'

    end
  end
  resources :posts do
    resources :comments
end

resources :comments do
    resources :comments
end
  resources :posts do
    resources :likes
  end
  
 
  # Defines the root path route ("/")
  # root "articles#index"
end
