Rails.application.routes.draw do
  resources :users
  resources :dogs do
    resources :dogphotos, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
