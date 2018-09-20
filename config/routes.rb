Rails.application.routes.draw do
  root to: 'pages#index'

  get '/try-online', :to => 'pages#try', :as => 'try'
  get '/benchmarks', :to => 'pages#benchmarks', :as => 'benchmarks'
  post '/create-task', :to => 'pages#create_task', :as => 'create_task'
end
