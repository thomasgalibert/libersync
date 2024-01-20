resources :hoas do
  resources :lots
end

resources :lots do
  resources :ownerships
end