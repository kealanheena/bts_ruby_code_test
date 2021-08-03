Rails.application.routes.draw do
  get '/', to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/identify_hand', to: 'pages#create'
end
