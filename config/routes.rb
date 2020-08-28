Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  
  resources  :users     ,only: [:new, :create]
  resources  :items do
    resources  :purchases ,only: [:new, :create]
  end
  
end
