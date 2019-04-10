Rails.application.routes.draw do


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'owners#home'

get '/login' => 'sessions#new'

post '/login' => 'sessions#create'
post '/owners/new' => 'owners#create'


get '/auth/:provider/callback', to: 'sessions#create'

get '/logout' => 'sessions#destroy'



resources :owners, only: [:new]

resources :owners, only: [:show] do
  resources :pets, only: [:show, :index,:new,:create,:edit,:update]
end

resources :clinics, only: [:index,:new,:create]
resources :pets, only: [:destroy,:new]

end
