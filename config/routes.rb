Rails.application.routes.draw do
  devise_for :users
  root to: 'timeline#index'

  resources :users, param: :name, path: '/' do
    resources :statuses, except: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
