namespace :emailings do
  resources :payments, only: [:create]
end