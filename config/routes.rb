Semantic::Application.routes.draw do

  devise_for :users do
    get '/login'  => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :screencasts
  resources :comments
  resources :episodes
  resources :tags

  match 'que-es-semantic', :to => 'pages#about', :as => :about
  match ':participant', :to => 'pages#participant', :constraints => { :participant => /(bernat|jordi|masumi)/ }
  match 'membres', :to => 'pages#members', :as => :membres

  root :to => "episodes#index"
end
