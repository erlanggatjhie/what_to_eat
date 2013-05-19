require 'spec_helper'
require 'bcrypt'

describe User do
  it { should respond_to(:username) }
  it { should respond_to(:password) }

  subject(:user) { User.new(username: "username", password: "password")  }

  before(:each) do 
    salt = "salt"
    return_value = "hash value"
    BCrypt::Engine.stub(:generate_salt).and_return(salt)
    BCrypt::Engine.stub(:hash_secret).with(user.password,salt).and_return(return_value)
    user.stub(:salt).and_return("salt")
    user.stub(:id).and_return(1)
  end

  it "should encrypt password" do
    expect { user.send(:encrypt_password) }.to change { user.password }.to("hash value")
  end

  it "should invoke encrypt password while saving" do
    user.should_receive(:encrypt_password)
    user.save  
  end

  it "should empty password after saving" do
    expect { user.save }.to change { user.password }.to("")
  end

  it "should authenticate" do
    user.password = "hash value"
    User.stub(:find_by_username).with(user.username).and_return(user)
    User.authenticate(user.username, "password").should == 1 
  end
end
