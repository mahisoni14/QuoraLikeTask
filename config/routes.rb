Rails.application.routes.draw do
  resources :topics
  resources :answers
  resources :questions
  root to: "homes#index"
  resources :homes, only: :index do
    post :follow_topic, on: :collection
    post :follow_user, on: :collection
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
