WhatToEat::Application.routes.draw do

  # Admin Controllers
  match "/admin/authenticate" => "admins#authenticate"
  match "/admin/login" => "admins#login", as: 'login'
  match "/admin/logout" => "admins#logout", via: :delete

  # Restaurant Controllers
  match "admin/show_all" => "restaurants#show_all", as: "show_all"  
  match "admin/restaurant/:id/edit" => "restaurants#edit", as: "edit"
  match "admin/restaurant/:id/perform_edit" => "restaurants#perform_edit", as: "perform_edit", via: :put
end
