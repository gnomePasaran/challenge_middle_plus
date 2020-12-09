Rails.application.routes.draw do
  devise_for :users

  root to: 'events#index'

  resources :events do
    collection do
      resource :export, only: %i[create], module: :events
    end
  end
end
