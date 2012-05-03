LivingDreamy::Application.routes.draw do
  root :to => 'dreams#index'
  resources :dreams

  get 'login' => 'sessions#create', :as => 'login'
end
