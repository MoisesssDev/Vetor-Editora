Rails.application.routes.draw do
  devise_for :psychologists

  root to: "home#index"

  resources :evaluateds, only: %i[new create show]

  resources :instruments, only: %i[index] do
    get 'select_evaluateds', on: :member
    post 'apply', on: :member
    get 'answer', on: :member
  end

  resources :instruments_applied, only: %i[show] do
    post 'verifications', on: :member
  end
end
