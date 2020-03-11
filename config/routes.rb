Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show], param: :username do
    resources :notes, only: %i[index show edit update destroy], param: :slug
  end
  resources :notes, only: %i[new create]
  get '/notes', to: 'notes#all'
end
