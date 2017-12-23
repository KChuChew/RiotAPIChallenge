Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'champion#index'
  get '/champion/runes', to: 'champion#rune_page', as: 'runes'
  #get '/champion/', to:'champion#rune_page', as: 'runes'
end
