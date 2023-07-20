Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :user , only: [:index, :create, :update]
  post '/user' ,to: "user#index"
  post '/user/create' ,to: "user#create"
  post '/user/update' ,to: "user#update"
  post '/auth/logout' ,to: "authentication#logout"
  post '/user/:username',to: "user#show"
  #post "user", to: "user#login"
  post "/auth/login",to: "authentication#login"
  post '/*a', to: 'application#not_found'
end
