Rails.application.routes.draw do
  resources :relationship_mgrs
  resources :loans
  resources :applications
  resources :borrowers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
