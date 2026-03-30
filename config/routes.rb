Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  # ゲストログイン用のルート設定
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [ :show, :edit, :update ] do
    member do
      get :account
    end
  end

  resources :contents do
    collection do
      get :my_contents
    end
    resources :tags, only: [ :new, :create]
    resources :posts, only: [ :new, :create, :destroy ]
  end

  resources :tags, except: [ :new, :create]
  resources :posts, except: [ :new, :create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#top"
end
