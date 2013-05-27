WhatToEat::Application.routes.draw do
  match "/admin/authenticate" => "admins#authenticate"
  match "/admin/login" => "admins#login", as: 'login'
end
