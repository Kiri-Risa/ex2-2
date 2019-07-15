Rails.application.routes.draw do
  get 'help/home'

  root 'application#hello'
end
