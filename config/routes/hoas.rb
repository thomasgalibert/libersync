resources :hoas do
  resources :lots
  resources :mandats
end

resources :lots do
  resources :ownerships
end