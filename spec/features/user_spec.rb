require 'rails_helper'

RSpec.feature "Users", type: :feature do
  given!(:user) { user = User.create(email:"owna@gmail.com",password: "passwd",password_confirmation:"passwd")}

  scenario "sign in with valid credentials" do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    check "Remember me"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
end
