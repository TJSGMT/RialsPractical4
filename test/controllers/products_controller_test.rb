require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
  end

  def setup 
  @user = User.create(email:"tejas@gamit.com", password:"tjstjs",password_confirmation:"tjstjs")
  @product = Product.new(product_name: "wearables",price: 200,user_id:@user.id, description:"Nikey hyperevenom")
  @product.save
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create Product" do
    @user1 = User.create(email:"tjs@exa.com", password:"tjstjs",password_confirmation:"tjstjs")
    assert_difference("Product.count",1){
      post products_path,params:{product:{product_name: "shoes",price:2200,description:"puma r78 sneakers",user_id: @user1.id}}
    }
    assert_redirected_to products_url
  end

  test "should get edit" do
    get edit_product_path(@product.id)
    assert_response :success
  end

  test "should get show" do
    get product_path(@product)
    assert_response :success
  end

  test "should get update" do
  patch product_path(@product),params:{product:{product_name: "tejas"}}  
  assert_redirected_to products_url
end
   
  test "should get destroy" do
    get products_path(@product)
    assert_response :success
  end
end
