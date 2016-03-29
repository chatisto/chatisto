Rails.application.routes.draw do
  root 'start#show'
  resources :rooms, only: [:show]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
