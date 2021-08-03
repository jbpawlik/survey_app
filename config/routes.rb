Rails.application.routes.draw do
  root to: 'surveys#index'
  resources :surveys do
    member do
      get 'answers'
      patch 'answers'
    end
    resources :questions
  end
end
