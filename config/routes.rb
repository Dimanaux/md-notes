Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show], constraints: { username: /[\w\.-]+/ } do
    resources :notes, module: :users
  end
  resources :notes, only: %i[index]
end
