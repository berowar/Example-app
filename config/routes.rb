SocialNetwork::Application.routes.draw do

  root :to => "home#index"

  resource :profile, :controller => 'profile'
  resources :groups do
    post "/join_to_group", :to => "groups#join_to_group", :as => :join
    resources :articles
  end

  resources :articles do
    resources :comments
  end

  devise_for :users

end
