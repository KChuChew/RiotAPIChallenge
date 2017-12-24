Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'champion#index'
<<<<<<< HEAD
  get '/champion/runes', to: 'champion#rune_page', as: 'runes'
  #get '/champion/', to:'champion#rune_page', as: 'runes'
=======

  resources :champion
  resources :runes

>>>>>>> ab94e951b133a20c4f5fa805dc1fd943c1043094
end
