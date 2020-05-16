Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: :logout
  get 'status' => 'status#index', defaults: { format: 'json' }

  resource :retirements, only: %i[new create]
  resources :events do
    resources :tickets
  end
end
