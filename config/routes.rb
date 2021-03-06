Rails.application.routes.draw do

  devise_for :users

  get 'welcome/index'

  get '/documents/archive', to: 'documents#archive', as: 'archive'
  
  resources :documents
  resources :categories

  authenticated :user do
    root to: "documents#index", as: "authenticated_root"
  end

  root to: "welcome#index"

end
