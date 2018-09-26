Rails.application.routes.draw do
  namespace :admin do
      resources :testcases

      root to: "testcases#index"
    end
  root to: 'pages#index'

  get '/editor/:id', :to => 'pages#try', :as => 'try'
  get '/benchmarks', :to => 'pages#benchmarks', :as => 'benchmarks'
  post '/create-task', :to => 'pages#create_task', :as => 'create_task'
end
