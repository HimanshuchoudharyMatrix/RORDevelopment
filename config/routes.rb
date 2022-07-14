Rails.application.routes.draw do

  
  mount Ckeditor::Engine => '/ckeditor'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/delete'
  resources :posts  do
    resources :comments
  end
  root to: 'users#welcome'

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmation: 'confirmation'
    }

  namespace :admin do
    root to: 'users#welcome'
    
    resources :users
    resources :posts  do
      resources :comments
    end 
    get '/users/:id/posts', to: 'users#user_post', as: 'user_post'
  end

  get '/users/:id/posts', to: 'users#user_post', as: 'user_post' #custom routes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
