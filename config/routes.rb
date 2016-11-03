Rails.application.routes.draw do

  resources :notes, :except => [:index, :patch, :show]
  
  get '/notes/:id' => redirect("/:id")

  get '/:name', to: 'notes#new'
  post '/:name', to: 'notes#new'
  patch '/:name', to: 'notes#update'

  get '/:name', to: 'notes#show'
  root 'notes#new'

  get '*id', to: 'notes#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
