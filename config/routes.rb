Rails.application.routes.draw do

  get "/", controller: :home, action: :home
  get "/research", controller: :home, action: :research
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
