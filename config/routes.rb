Rails.application.routes.draw do
  # post 'reckoner/create'
  match 'reckoner', to: 'reckoner#create', via: [:post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
