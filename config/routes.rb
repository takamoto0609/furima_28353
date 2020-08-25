Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources  :items
  resources  :users     ,only: [:new, :create]
  resources  :addresses ,only: [:new, :create]
  resources  :purchases ,only: [:new, :create]
end
