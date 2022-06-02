require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @user = User.create(email:"bsdvcfkgm@tjs.com",password:"tjstjs",password_confirmation:"tjstjs")
    @product = Product.new(product_name:"wearables", description:"puma r78 sneaks",price:"3200",user_id:@user.id)
    @product.save
  end

  it "Has a name" do
    expect(@product).to be_valid
  end

  it "Is product name field  nill" do
    @product.product_name = " "
    expect(@product).to_not be_valid
  end

  it "Description have maximum length of 10 character " do
    expect(@product).to be_valid
  end

  it "Description is shorter than 10 character " do
    @product.description = "g"
    expect(@product).to_not be_valid
  end
end
