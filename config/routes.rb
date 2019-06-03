Rails.application.routes.draw do
  ### User routes
  resources :users do
    # Create login route
    collection do
      post '/login', to: 'users#login'
    end

    # Nest dog create route within users to access user_id as param
    resources :dogs, only: [:create]
  end

  ### Dog routes
  resources :dogs, except: [:create] do
    resources :dogphotos, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
