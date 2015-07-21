Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :token, :controller=>"token" do
    resources :streams
  end
end
