Rails.application.routes.draw do
  get 'twilio/reply'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resource :messages do
    collection do
      post 'reply'
    end
  end

  root to: "messages#index"

end
