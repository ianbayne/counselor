Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_for :counsellors, path: 'counsellors', controllers: {
    sessions: "counsellors/sessions",
    registrations: "counsellors/registrations"
  }
  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
    resources :moods, only: [:new, :create]
    resources :users do
      resources :appointments, only: [:show]
    end
    resources :counsellors
    resources :questions, only: [:index]
    resources :answers, only: [:new, :create]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :appointments, only: [:index, :new, :create]
    resources :conversations do
      resources :messages
    end
    resources :goals, only: [:new, :create, :destroy]
  end
end
