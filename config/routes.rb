Rails.application.routes.draw do

  root to: 'events#index'
  devise_for :users

  resources :events do
    get 'stream', on: :member
  end
  resources :token, :controller=>"token" do
    resources :streams
  end
end
