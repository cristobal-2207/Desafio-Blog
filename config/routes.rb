Rails.application.routes.draw do
  get  'posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  get '/posts', to: 'posts#index'
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
end
