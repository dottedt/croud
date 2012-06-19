Aya2::Application.routes.draw do

  devise_for :users

  resources :teams, :only => [:index, :edit, :update]

  resources :notes

  # resources :courses

  # resources :groups

  resources :users, :except => [:destroy, :create, :new] do
    resources :notes
  end

  # resources :sessions

  # get '/signin' => 'sessions#new', as: :sign_in
  # get '/logout' => 'sessions#destroy', as: :sign_out

  get '/all' => 'users#index', as: :all
  get '/students' => 'users#students', as: :students
  get '/webdev' => 'users#webdev', as: :webdev
  get '/html_css' => 'users#html', as: :html
  get '/ux' => 'users#ux', as: :ux
  get '/alumni' => 'users#alumni', as: :alumni
  get '/mentor' => 'users#mentor', as: :mentor
  get '/staff' => 'users#staff', as: :staff

  root to: 'teams#index'

end
