SocialNetwork::Application.routes.draw do
  root :to => "home#index"

  resource :profile, :controller => 'profile'

  devise_for :users

end
