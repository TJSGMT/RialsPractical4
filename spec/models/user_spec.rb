require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.create(email:"bsdvcfkgm@tjs.com",password:"tjstjs",password_confirmation:"tjstjs")
  end

  it "has a valid user" do
    expect(@user).to be_valid
  end

  it "email must not br blank"do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it "password length must be greater than 6"do
    expect(@user).to be_valid
  end

  it "has same password and confirmation"do
    @user.password == @user.password_confirmation
    expect(@user).to be_valid
  end
end  
