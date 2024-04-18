Rails.application.routes.draw do
  devise_for :psychologists

  root to: "home#index"
end
