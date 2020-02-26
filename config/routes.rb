Rails.application.routes.draw do
  resources :notes
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show], param: :username
end
