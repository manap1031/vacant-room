Rails.application.routes.draw do
  devise_for :owners
  root to: "rooms#index"
  resources :rooms
 
end
