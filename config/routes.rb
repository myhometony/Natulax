Rails.application.routes.draw do
  namespace :admin do
    resources :categories, only:[:index, :create, :edit, :update, :destroy]
  end
  namespace :admin do
    resources :post_images, only:[:index, :show, :destroy]
  end
  namespace :public do
    resources :post_images
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
