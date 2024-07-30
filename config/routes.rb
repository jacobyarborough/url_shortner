Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  get '/:base58', to: "redirects#show"
  
  namespace :api do
    resources :generator, only: [:create]
    resources :retrievals, only: [:create]
  end

  resources :short_urls
end
