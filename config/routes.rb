WhatToEat::Application.routes.draw do
  match "/admin/authenticate" => "admins#authenticate"
end
