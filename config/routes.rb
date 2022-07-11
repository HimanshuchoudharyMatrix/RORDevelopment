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

  root to: 'users#index'
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    }

  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
