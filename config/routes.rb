Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show] do
    resources :notes, module: :users
  end
  resources :notes, only: %i[index]

  namespace :api do
    namespace :v1 do
      resources :users, only: [], constraints: { user_id: /[\w\.-]+/ } do
        resources :notes, only: [], module: :users do
          resources :ratings, module: :notes, only: %i[create update destroy]
        end
      end
    end
  end
end
