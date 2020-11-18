Rails.application.routes.draw do
	namespace :api do
    resources :user, only: [:show, :create, :update, :destroy]
    get 'users' => 'user#index'
    get 'typehead/:input' => 'user#index'
  end
end
