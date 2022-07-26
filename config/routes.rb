Rails.application.routes.draw do


  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update]
    resources :post_images, only: [:show, :index, :destroy]
    resources :tags, only: [:index, :edit, :create, :update, :destroy]
  end
  scope module: :user do
    get '/users/:id/favorites' => 'users#favorites'
    root to: 'homes#top'
    get '/users/my_page/' => 'users#show'
    get '/users/edit' => 'users#edit'
    patch '/users' => 'users#update'
    resources :users, only: [] do
      member do
        get :post_images
        get :favorites
      end
    end
    resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  end



  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
