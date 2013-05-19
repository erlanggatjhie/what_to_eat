require 'bcrypt'

class User < ActiveRecord::Base 
  include BCrypt
  
  attr_accessible :password, :username
  before_save :encrypt_password
  after_save :empty_password

  private
  def encrypt_password
    if self.password.present?
      salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(self.password, salt)
    end  
  end

  def empty_password
    self.password = ""
  end

end
