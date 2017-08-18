Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create]
  end 

  resources :doses, only: [:index, :destroy]

  root 'cocktails#index' 
end
