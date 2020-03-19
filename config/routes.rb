Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: %i[show], constraints: { user_id: /[\w\.-]+/ } do
    resources :notes, module: :users do
      resources :ratings, module: :notes, only: %i[index create update destroy]
    end
  end
  resources :notes, only: %i[index]
end
