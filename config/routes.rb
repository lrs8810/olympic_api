Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      resources :events, only: [:index]

      get '/olympian_stats', to: 'olympian_stats#index'
      get '/events/:id/medalists', to: 'events/medalists#show'
    end
  end
end
