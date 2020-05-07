Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  constraints(SubdomainConstraint) do
    scope module: :users do
      root to: "pages#index", as: :user_root
      resources :notes
    end
  end

  root to: "notes#index"

  resources :subscriptions, only: %i[create destroy]
  resources :notes, only: %i[index]
end
