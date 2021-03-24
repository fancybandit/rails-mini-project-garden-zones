
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :growing_zones, only: [:index, :show]
  resources :plants, only: [:show, :new, :create, :edit, :update]
  get 'plants/:id/delete', to: 'plants#delete', as: 'delete_plant'
end

