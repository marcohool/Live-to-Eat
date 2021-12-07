Rails.application.routes.draw do

  resources :recipes do
    # Appends add or remove to url depending on if user wants to add or remove recipe from their collection
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
