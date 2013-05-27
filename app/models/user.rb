require 'bcrypt'

class User < ActiveRecord::Base 
  include BCrypt
  
  attr_accessible :password, :username
  before_save :encrypt_password
  after_save :empty_password


  def self.authenticate(username, password) 
    user = User.find_by_username(username)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user.id
    else
      raise UserException.new("Authentication Failed")
    end 
  end

  private
  def encrypt_password
    if self.password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
    end  
  end

  def empty_password
    self.password = ""
  end
end
