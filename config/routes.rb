Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources:users, only:[:new, :create, :show ,:destroy]
  resources:items, only:[:index, :new, :create]
  resources:purchasees
end

