require 'bcrypt'

class User < ActiveRecord::Base 
  include BCrypt
  
  attr_accessible :password, :username
  before_save :encrypt_password

  private
  def encrypt_password
    if password.present?
      salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(self.password, salt)
    end  
  end
end
