Rails.application.routes.draw do
  mount Panicboat::Engine, at: '/panicboat'

  resources :health,        only: %i[index]
  resources :members,       only: %i[index show create update destroy]
end
