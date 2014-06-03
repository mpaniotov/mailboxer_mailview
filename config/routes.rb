Messaging::Application.routes.draw do
  root to: 'home#show'

  devise_for :users
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  if Rails.env.development?
    mount Notifier::Preview => 'notifier_preview'
    mount MailPreview => 'mail_view'
  end

end
