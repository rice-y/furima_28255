Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources:users, only:[:new, :create, :destroy]
  resources:items
 
end

