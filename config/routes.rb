Rails.application.routes.draw do
  resources :homes
  resources :guest_infos
  resources :bookings
  resources :shifts
  resources :participations do
    collection do
      post "accept_new_participation", action: :accept_new_participation, as: :accept_new_participation
    end
  end
  root "homes#index"
  devise_for :users, controllers: { sessions: "sessions" }

  resources :users, except: %i[update] do
    post :update, on: :member
    get :toggle_active_user, on: :member
    get :new_user_form, on: :collection
    post :auto_user_creation, on: :collection
  end
end
