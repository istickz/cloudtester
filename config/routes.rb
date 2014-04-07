Cloudtester::Application.routes.draw do
  devise_for :users, path: "profile", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  authenticated :user do
    root to: "profile#index", as: :authenticated_root
  end
  unauthenticated do
    root 'home#index'
  end

  get "profile" => 'profile#index'
  get 'exam/test/:id/question/:question_id' => 'exam#show'

  post 'exam/check'

  resource :profile do
    resources :tests do
      resources :questions do
        collection do
          post 'reorder'
        end
      end
    end
  end



end
