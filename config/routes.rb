Rails.application.routes.draw do
  resources :urls, only: %i[new create show] do
  end
  get 'reports/usage', to: 'reports#usage'

  root 'urls#index'
  get '*path' => redirect('/')
end
