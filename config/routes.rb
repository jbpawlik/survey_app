Rails.application.routes.draw do
  root to: 'surveys#index'
  resources :surveys do
    member do
      get 'answers'
      post 'answers_update'
    end
    resources :questions
  end
end
