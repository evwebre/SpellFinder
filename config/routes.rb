Rails.application.routes.draw do
  resources :spells
  root to: 'spells#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
