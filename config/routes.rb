Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # add resources here under controllers
      # namespaced with api
      resources :users, only: %i[show create update destroy]
      resources :tokens, only: %i[create]
      resources :products, only: %i[index show create update destroy]
      resources :orders, only: %i[index show]
    end
  end
end
