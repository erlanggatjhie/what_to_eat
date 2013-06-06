WhatToEat::Application.routes.draw do
  root :to => "restaurants#index"

  # Admin Controllers
  match "/admin/authenticate" => "admins#authenticate", as: "authenticate"
  match "/admin/login" => "admins#login", as: 'login'
  match "/admin/logout" => "admins#logout", via: :delete

  # Restaurant Controllers
  match "admin/show_all" => "restaurants#show_all", as: "show_all"  
  match "admin/restaurant/:id/edit" => "restaurants#edit", as: "edit"
  match "admin/restaurant/:id/perform_edit" => "restaurants#perform_edit", as: "perform_edit", via: :put
  match "admin/restaurant/insert" => "restaurants#insert", as: "insert"
  match "admin/restaurant/new" => "restaurants#new", as: "new", via: :post
  match "admin/restaurant/:id/destroy" => "restaurants#destroy", as: "destroy", via: :delete
  match "index" => "restaurants#index", via: :get
  match "decide" => "restaurants#show_random_restaurant", via: :post
end
