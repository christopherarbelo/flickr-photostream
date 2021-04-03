Rails.application.routes.draw do
  root 'static_pages#photostream'
  get '/photostream', to: 'static_pages#photostream'
end
