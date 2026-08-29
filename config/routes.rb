Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :sign_up
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :articles
  resources :hashtags
  resources :tags

  get "article_list", to: "pages#articles", as: :article_list
  get "hashtag_index", to: "hashtags#index", as: :hashtag_index
  get "about", to: "pages#about", as: :about
  get "sorry", to: "pages#sorry", as: :sorry

  # Defines the root path route ("/")
  root "pages#home"
end
