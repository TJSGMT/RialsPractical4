require 'rails_helper'

RSpec.describe "Users", type: :request do
  include Devise::Test::IntegrationHelpers
  setup do
    @user = User.create(email: "GT@ex.com", password: "password", password_confirmation: "password")
    sign_in @user
  end

  it "get index path" do
    get products_path
    expect(response).to have_http_status(200)
  end

  it "get new path" do
    get new_product_path
    expect(response).to be_successful
  end
end
