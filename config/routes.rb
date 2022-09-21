Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    delete 'sign_out' => "profiles#update"
  end
  resources :users, :bugs, :comments, :keywords
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post "/bugs/:id" => "comments#create"
  # root "articles#index"
end
