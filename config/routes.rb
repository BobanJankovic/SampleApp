Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "drinks#index"
  resources :drinks
  delete '/drinks/:id' => 'drinks#destroy', as: :delete_drink 
end
