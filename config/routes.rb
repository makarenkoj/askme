Rails.application.routes.draw do
	root 'users#index'

  # Ресурс пользователей (экшен destroy поддерживается)
  resources :users

  # Ресурс сессии (только три экшена :new, :create, :destroy)
  resource :session, only: [:new, :create, :destroy]

  # Ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]

end
