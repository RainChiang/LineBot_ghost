Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/ghost/eat', to: 'ghost#eat'
  get '/ghost/request_headers', to: 'ghost#request_headers'
  get '/ghost/request_body', to: 'ghost#request_body'
  get '/ghost/response_headers', to: 'ghost#response_headers'
  get '/ghost/response_body', to: 'ghost#show_response_body'
  get '/ghost/sent_request', to: 'ghost#sent_request'

  post '/ghost/webhook', to: 'ghost#webhook'
end
