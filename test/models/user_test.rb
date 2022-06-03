require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "tjs@tjs.tjgvb",password: "tjstjs",password_confirmation:"tjstjs" )
    @user.save
  end

  test "data should be valid" do
    assert @user.valid? 
  end

  test "email can't be blank" do
    @user.email = ""
    assert_not  @user.save
  end

  test "pasword should be grater than 6 character" do
    @user.password = "tjsjs"
    assert_not @user.save
  end
end
