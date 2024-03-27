Rails.application.routes.draw do
  draw :emailings
  resources :meetings
  draw :owners
  draw :budgets
  draw :hoas
  draw :base
end
