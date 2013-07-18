Down::Application.routes.draw do
  root 'components#index'

  put '/:id/repaired', to: 'components#repaired'
  put '/:id/crashed', to: 'components#crashed'
  put '/:id/fault', to: 'components#fault'

  get '/stream', to: 'components#stream'
end