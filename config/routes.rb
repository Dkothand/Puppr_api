Rails.application.routes.draw do
  resources :users do
    resources :dogs, only: [:create]
  end
  # Removing create route from /dogs, only /users/:user_id/dogs route should create dog
  resources :dogs, except: [:create] do
    resources :dogphotos, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
