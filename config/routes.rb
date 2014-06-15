Rails.application.routes.draw do
root 'home#index'
get "home/index"
get "home/tweet"
get "home/add_status"
post "home/add_member"
get '/auth/:provider/callback', :to => 'sessions#callback'
post '/auth/:provider/callback', :to => 'sessions#callback'
get '/logout' => 'sessions#destroy', :as => :logout
end
