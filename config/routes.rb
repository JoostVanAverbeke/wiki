Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :law_articles
  resources :authors

  namespace :api do
    namespace :v1 do
      jsonapi_resources :authors
      jsonapi_resources :law_articles
    end
  end
end
