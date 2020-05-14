Rails.application.routes.draw do
  constraints subdomain: "www" do
    devise_for :users, controllers: { registrations: "users/registrations" }
    resources :notes, only: %i[index]
  end

  constraints(SubdomainConstraint) do
    scope module: :users do
      root to: "pages#index", as: :user_root
      resources :notes
      resources :subscriptions, only: %i[create destroy]
    end
  end

  root to: redirect(subdomain: "www", path: "/notes")
end
