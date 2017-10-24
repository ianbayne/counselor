Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_for :counsellors, path: 'counsellors', controllers: { 
    sessions: "counsellors/sessions",
    registrations: "counsellors/registrations"
  }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
