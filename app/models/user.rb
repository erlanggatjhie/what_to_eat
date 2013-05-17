require 'bcrypt'

class User < ActiveRecord::Base 
  include BCrypt
  
  attr_accessible :password, :username

  def encrypt_password
    if password.present?
      salt = BCrypt::Engine.generate_salt
      password = BCrypt::Engine.hash_secret(password, salt)
    end  
  end
end
