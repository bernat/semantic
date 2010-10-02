Semantic::Application.routes.draw do

  resources :screencasts
  resources :comments
  resources :episodes
  resources :tags

  match 'que-es-semantic', :to => 'pages#about', :as => :about
  match 'bernat', :to => 'pages#bernat'
  match 'jordi', :to => 'pages#jordi'
  match 'masumi', :to => 'pages#masumi'
  match 'membres', :to => 'pages#membres', :as => :membres

  root :to => "episodes#index"
end
