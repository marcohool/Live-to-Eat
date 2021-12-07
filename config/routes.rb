Rails.application.routes.draw do

  resources :recipes do
    member do
      put "add", to: "recipes#set_collection"
      put "remove", to: "recipes#set_collection"
    end
  end

  devise_for :users

  get "collection/index", to: "collection#index"

  get "contact", to: "home#contact"
  post 'request_contact', to: 'home#request_contact'

  root "home#home"
end
