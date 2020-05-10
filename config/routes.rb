Rails.application.routes.draw do
  root to: "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: :logout

  resources :events do
    resources :tickets
  end
end
