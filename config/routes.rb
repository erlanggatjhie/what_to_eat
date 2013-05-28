WhatToEat::Application.routes.draw do
  match "/admin/authenticate" => "admins#authenticate"
  match "/admin/login" => "admins#login", as: 'login'
  
  match "/admin/show_all" => "admins#show_all", as: "show_all"
end
