Cloudtester::Application.routes.draw do
  get 'exam/test/:id/question/:question_id' => 'exam#show'
  post 'exam/check'
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
