get "up" => "rails/health#show", as: :rails_health_check

resource :login, only: [:show, :destroy, :create, :new]
resource :registration, only: [:new, :create]

constraints ->(request) { request.session[:user_id].present? } do
  root "hoas#index", as: :dashboard
end

root "home#index"