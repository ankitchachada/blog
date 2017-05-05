Rails.application.routes.draw do
  devise_for :users 

  namespace :api, defaults: { format: 'json' } do
  	namespace :v1 do
  		resources :posts
  		devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  		resources :users, only: [:index,:show,:destroy,:update]
  	end
  end
end
