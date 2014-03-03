Cloudtester::Application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :tests do
    resources :questions do
      collection do
        post 'reorder'
      end
    end
  end
end
