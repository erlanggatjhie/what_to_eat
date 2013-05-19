require 'spec_helper'
require 'bcrypt'

describe User do
  it { should respond_to(:username) }
  it { should respond_to(:password) }

  it "should encrypt password" do
    user = User.new(username: "username", password: "password")
    BCrypt::Engine.should_receive(:generate_salt).and_return("salt")
    BCrypt::Engine.should_receive(:hash_secret).with(user.password,"salt").and_return("hash value")

    expect { user.send(:encrypt_password) }.to change { user.password }.to("hash value")
  end

  it "should invoke encrypt password while saving" do
    user = User.new(username: "username", password: "password")
    user.should_receive(:encrypt_password)
    user.save  
  end

end
