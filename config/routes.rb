Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'discourse/sso' => 'discourse_sso#sso'

  # redirect to root if nothing matched
  get '*path' => redirect('/')
end
