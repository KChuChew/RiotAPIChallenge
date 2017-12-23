Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'champion#index'
  get "../app/views/champion/dank.html.erb", to: "champion#champ_page", as: "champ_page"
end
