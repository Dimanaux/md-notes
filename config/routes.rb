Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  constraints(SubdomainConstraint) do
    root to: "users#show", as: :user_root
    scope module: :users do
      resources :notes
    end
  end

  root to: "pages#home"

  resources :subscriptions, only: %i[create destroy]
  resources :notes, only: %i[index]
end
