Rails.application.routes.draw do

  root 'home#top'

  devise_for :shops,skip: [:passwords], controllers: {
    registrations: "shop/registrations",
    sessions: 'shop/sessions'
  }

  devise_for :managements,skip: [:passwords], controllers: {
    registrations: "management/registrations",
    sessions: 'management/sessions'
  }

  scope module: :shop do
    resources :shops, only: [:edit, :update] do
      collection do
        get "my_page" => "shops#show"
      end
    end
    resources :posts do
      resources :comment_reviews, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :mother_father_gifts
    resources :summer_gifts
    resources :year_end_gifts
    resources :day_of_the_oxes
    resources :ehomakis
    resources :christmases
    get "chat/:id" => "chats#show", as: "chat"
    resources :chats, only: [:create]
  end

    namespace :management do
      resources :managements, only: [:edit, :update] do
        collection do
          get "my_page" => "managements#show"
        end
      end
      resources :posts do
        resource :management_favorites, only: [:create, :destroy]
      end
    end
end
