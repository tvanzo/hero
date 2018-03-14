Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "users/:id" => "users#show"
  get "jj" =>"home#t"
  get "answer" => "answers#index"
  get "answer/:id" => "answers#new"
  get 'posts/index'
  post 'answer/:id/create' =>"answers#create"
 
  post "likes/:post_id/create"=>"likes#create"
 post "likes/:post_id/destroy" => "likes#destroy"
 
 post 'posts/:id/comment' =>"comments#create"
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to =>"home#index"
  get 'posts' =>"posts#index"
  get 'posts/new' =>"posts#new"
  get ':id/asked' =>"youtubers#asked"
  post 'posts/create' =>"posts#create"
  get 'posts/:id' =>"posts#show"
  post "posts/:id/destroy" => "posts#destroy"
  get ':id' =>"youtubers#index"
  post ':id/create' =>"youtubers#create"
  post ':id/follow' =>"followers#create"
  post ':id/destroy' =>"followers#destroy"
end
