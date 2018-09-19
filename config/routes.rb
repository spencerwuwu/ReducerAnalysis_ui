Rails.application.routes.draw do
  root to: 'pages#index'

  get '/try-online', :to => 'pages#try', :as => 'try'
  get '/benchmarks', :to => 'pages#benchmarks', :as => 'benchmarks'
end
