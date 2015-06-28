Rails.application.routes.draw do
  root to: 'debug#empty'
  get '/_ping', to: 'debug#ping'
  post '/register', to: 'token#create'
  post '/deregister', to: 'token#destroy'
  post '/invite', to: 'invite#create'
end
