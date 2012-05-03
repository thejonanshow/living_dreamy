LivingDreamy::Application.routes.draw do
  root :to => 'dreams#index'
  resources :dreams
end
