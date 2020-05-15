Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, except: [:new, :edit] do
        resources :artworks, only: [:index]
        resources :collections, only: [:index]
        member do
            get "liked_comments"
            get "liked_artworks"
        end
    end

    resources :artworks,  except: [:new, :edit, :index] do
        member do
            patch "favorite"
        end
    end
    
    resources :artwork_shares, only: [:index, :create, :destroy] do 
        member do 
            patch "favorite"
        end
    end

    resources :comments, only: [:index, :create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :collections, only: [:create, :destroy, :show]

    resources :collection_members, only: [:create, :destroy]
end
