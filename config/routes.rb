Rails.application.routes.draw do
  devise_for :users
  root "notes#index"
  resources :users, only: [:edit, :update]
  resources :notes, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :pages, only: [:index, :create, :new, :destroy, :edit, :update] do
      collection do
        get 'search'
      end
    end
  end
end
