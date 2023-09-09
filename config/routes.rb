Rails.application.routes.draw do
  root "pages#main_page"
  devise_for :users

  resources :users do
    get :toggle_active_user, on: :member
    get :new_user_form, on: :collection
    post :auto_user_creation, on: :collection
  end
end
