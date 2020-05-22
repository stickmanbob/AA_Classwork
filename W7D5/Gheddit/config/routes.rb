Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users
  resource :session, only: [:new,:create,:destroy]
  # get '/session/destroy'
  resources :subs do
    member do
      resources :posts, only:[:new]
    end
  end

  resources :posts, except: [:index,:new]
end
