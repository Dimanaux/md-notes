Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show] do
    scope module: :users do
      resources :notes
    end
  end
  resources :subscriptions, only: %i[create destroy]
  resources :notes, only: %i[index]
end
