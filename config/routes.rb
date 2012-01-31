Mercury::Application.routes.draw do

  resources :tickets, only: [:index, :show, :create]

  root to: "tickets#index"
end
