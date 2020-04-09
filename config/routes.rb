Rails.application.routes.draw do
  root 'blogs#index'
  get 'about' => 'static_page#about'
  devise_for :users
  resources :blogs
end
