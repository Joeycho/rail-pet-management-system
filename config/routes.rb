Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'owners#home'

get '/login' => 'sessions#new'

post '/login' => 'sessions#create'
get '/auth/:provider/callback', to: 'sessions#create'

post '/logout' => 'sessions#destroy'

resources :owners, only: [:new, :create]

end
