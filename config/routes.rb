Rails.application.routes.draw do

  get '/demo' => 'home#demo', as: 'demo'

  devise_for :users
  resources :courses do
    collection do
      get 'search'
    end
  end

  resources :plans do
    member do
      put 'save'
      get 'add_course'
      delete 'remove_course'
      get 'check'
    end
  end
  
  resources :rules do
    collection do
      get 'display'
    end
  end

  get '/tag', to: 'tags#tag'
  get '/tag_all', to: 'tags#tag_all'  

  root :to => "courses#index"

end
