Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/search'
  resources :results do
    # results_controller の fetch_api_data アクションを呼び出すためのカスタムアクション
    post :fetch_api_data, on: :collection
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
