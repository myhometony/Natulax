Rails.application.routes.draw do

  namespace :admin do
    resources :end_users, only:[:index, :show, :update]
    resources :categories, only:[:index, :create, :edit, :update, :destroy]
    resources :post_images, only:[:index, :show, :destroy]
  end

  namespace :public do
    resources :post_images
    resources :end_users
  end

  devise_for :admin, skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  devise_for :end_users, controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  root to: 'homes#top'
end
