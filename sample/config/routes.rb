Rails.application.routes.draw do
  get '/blogs', to: 'blogs#index'
  get '/stocks', to: 'stocks#index'

end
