Rails.application.routes.draw do
  # the relationship manager route should display assigned borrowers
  resources :relationship_mgrs, only: [:index, :show] do
    resources :borrowers, only: [:index, :show]
  end
  resources :loans
  resources :applications
  resources :borrowers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
