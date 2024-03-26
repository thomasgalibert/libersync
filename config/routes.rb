Rails.application.routes.draw do
  resources :meetings
  draw :owners
  draw :budgets
  draw :hoas
  draw :base
end
