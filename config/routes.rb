Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'path#index'

  resources :users do
    collection do
      get 'login'
      post 'validate_login'
      get 'logout'
    end
  end

  resources :challenge do
    collection do
    end
  end

  resources :path do
    collection do
      get 'paths'
      get 'data_center'
    end
  end
end
