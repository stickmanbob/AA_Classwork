Rails.application.routes.draw do
  root to: 'static_pages#root',
  
  namespace :api, defaults {format: :jason} do 
      resources :todos, only:[:create, :index, :show, :destroy, :update]
  end resources :todos, only:[:create, :index, :show, :destroy, :update]
  end
end
