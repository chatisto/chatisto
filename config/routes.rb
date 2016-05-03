Rails.application.routes.draw do
  root 'start#show'
  resources :rooms, only: [:show] do
    get 'login', on: :member
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
