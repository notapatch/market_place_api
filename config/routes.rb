Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # add resources here under controllers
      # namespaced with api
    end
  end
end
