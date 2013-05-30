WhatToEat::Application.routes.draw do

  # Admin Controllers
  match "/admin/authenticate" => "admins#authenticate"
  match "/admin/login" => "admins#login", as: 'login'
  match "/admin/logout" => "admins#logout", via: :delete

  # Restaurant Controllers
  match "admin/show_all" => "restaurants#show_all", as: "show_all"  
  match "admin/restaurant/:id/edit" => "restaurants#edit", as: "edit"
end
