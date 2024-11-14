Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :book_clubs do
        member do
          get 'analytics'
        end
        resources :books, only: [:index, :show] do
          resources :summaries, only: [:index, :show, :create]
        end
      end
      post 'auth/login', to: 'authentication#login'
    end
  end
end