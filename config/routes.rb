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
  match 'bernat', :to => 'pages#bernat'
  match 'jordi', :to => 'pages#jordi'
  match 'masumi', :to => 'pages#masumi'
  match 'membres', :to => 'pages#membres', :as => :membres

  root :to => "episodes#index"
end
