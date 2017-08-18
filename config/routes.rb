Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create, :update] do
    resources :doses, only: [:create]
  end 
  resources :doses, only: [:destroy]
  root 'cocktails#index'

  mount Attachinary::Engine => "/attachinary"
end
