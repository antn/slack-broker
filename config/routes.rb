Rails.application.routes.draw do
  root to: 'debug#empty'
  get '/_ping', to: 'debug#ping'
  post '/token/register', to: 'token#create'
  post '/token/deregister', to: 'token#destroy'
  post '/team/invite', to: 'team#invite'
  post '/team/info', to: 'team#info'
end
