Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    # add resources here under controllers
    # namespaced with api
  end
end
