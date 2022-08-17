Rails.application.routes.draw do


  namespace :admin do
    root to: 'homes#top'
  end
  scope module: :user do
    root to: 'homes#top'
    get '/users/my_page' => 'users#show'
    get '/users/edit' => 'users#edit'
    patch '/users' => 'users#update'
    get '/users/confirm' => 'users#confirm'
    patch '/users/withdraw' => 'users#withdraw'
    resources :post_images, only: [:new, :create, :index, :show]
  end



  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
