LivingDreamy::Application.routes.draw do
  get "dreams/index"

  get "dreams/show"

  get "dreams/new"

  get "dreams/edit"

  resource :dream
end
