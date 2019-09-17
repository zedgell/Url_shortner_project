Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'link#index'
  get '/top.json', to: 'link#top'
  resources :link
  get '/:short_url', to: 'link#send_to_url'
  get '/', to: 'link#index'
end
