Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show] do
    scope module: :users do
      resources :notes
      resources :subscriptions, only: %i[create destroy]
    end
  end
  resources :notes, only: %i[index]
end
