Rails.application.routes.draw do

  root to: "homes#top"

  devise_for :admin, skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  devise_for :end_users, controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :admin do
    get :"admin/", to: "admin/sessions#new"
  end

  devise_scope :end_user do
    post :"end_users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  namespace :admin do
    resources :end_users, only:[:index, :show, :update]
    resources :categories, only:[:index, :create, :edit, :update]
    resources :post_images, only:[:index, :show, :destroy] do
      resources :comments, only:[:destroy]
    end
  end

  namespace :public do
    get :"end_users/unsubscribe", to: "end_users#unsubscribe"
    patch :"end_users/withdraw", to: "end_users#withdraw"
    resources :end_users, only:[:index, :show, :edit, :update]do
      member do
        get :favorites
      end
    end
    resources :post_images do
      resource :favorites, only:[:create, :destroy]
      resources :comments, only:[:create, :destroy]
    end
  end

end
