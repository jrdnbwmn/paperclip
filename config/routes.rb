Rails.application.routes.draw do

  root to: "documents#index"

  devise_for :users

  resources :documents

end
