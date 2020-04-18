require "subdomain"

#                   Prefix Verb   URI Pattern                       Controller#Action
#         new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)          devise/sessions#create
#     destroy_user_session GET    /users/sign_out(.:format)         devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#            user_password PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
#                          POST   /users/password(.:format)         devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)           users/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)          users/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             users/registrations#edit
#        user_registration PATCH  /users(.:format)                  users/registrations#update
#                          PUT    /users(.:format)                  users/registrations#update
#                          DELETE /users(.:format)                  users/registrations#destroy
#                          POST   /users(.:format)                  users/registrations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
#        user_confirmation GET    /users/confirmation(.:format)     devise/confirmations#show
#                          POST   /users/confirmation(.:format)     devise/confirmations#create
#          new_user_unlock GET    /users/unlock/new(.:format)       devise/unlocks#new
#              user_unlock GET    /users/unlock(.:format)           devise/unlocks#show
#                          POST   /users/unlock(.:format)           devise/unlocks#create
#                     user GET    /                                 users#show
#                    notes GET    /notes(.:format)                  users/notes#index
#                          POST   /notes(.:format)                  users/notes#create
#                 new_note GET    /notes/new(.:format)              users/notes#new
#                edit_note GET    /notes/:id/edit(.:format)         users/notes#edit
#                     note GET    /notes/:id(.:format)              users/notes#show
#                          PATCH  /notes/:id(.:format)              users/notes#update
#                          PUT    /notes/:id(.:format)              users/notes#update
#                          DELETE /notes/:id(.:format)              users/notes#destroy
#                     root GET    /                                 pages#home
#            subscriptions POST   /subscriptions(.:format)          subscriptions#create
#             subscription DELETE /subscriptions/:id(.:format)      subscriptions#destroy
#                          GET    /notes(.:format)                  notes#index

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  constraints(Subdomain) do
    get "/", to: "users#show", as: :user
    scope module: :users do
      resources :notes
    end
  end

  root to: "pages#home"

  resources :subscriptions, only: %i[create destroy]
  resources :notes, only: %i[index]
end
