Rails.application.routes.draw do
  root "pages#main_page"
  devise_for :users

end
