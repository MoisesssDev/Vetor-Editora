Rails.application.routes.draw do
  devise_for :psychologists

  root to: "home#index"

  resources :evaluateds, only: %i[new create show]

  resources :instruments, only: %i[index] do
    get 'select_evaluateds', on: :member
    post 'apply', on: :member
  end
end
