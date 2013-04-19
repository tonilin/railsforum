Railsforum::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'home#index'

  resources :boards do
    resources :topics
  end



end
