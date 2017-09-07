Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }

  root 'home#redirection'
  get 'home/redirection'
  get 'show' => 'users#show'
  #devise_scope :user do
  #  root to: "devise/sessions#new"
  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
