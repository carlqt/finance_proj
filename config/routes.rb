Rails.application.routes.draw do
  devise_for :users
  get '/forms/select' => "forms#select", as: :forms_select
  resources :forms, only: [:index]

  resources :with_pos do
    patch :reject
    patch :approve
    patch :submit
  end
  resources :without_pos do
    patch :reject
    patch :approve
    patch :submit
  end

  resources :admins, only: [:new, :create]
  root 'forms#select'
end
