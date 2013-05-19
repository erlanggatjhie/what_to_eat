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

  it "should match password correctly" do
  #  user.match_password("password").should be_true
    
  end

end
