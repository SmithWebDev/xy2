require "rails_helper"

RSpec.feature "User Sign Up" do
  
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email",	with: "user@example.com" 
    fill_in "Password",	with: "password" 
    fill_in "Password Confirmation", with: "password" 
    click_button "Sign Up"


    expect(page).to have_content("You have signed up successfully") 
  end
  
  scenario "with invalid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email",	with: "" 
    fill_in "Password",	with: "" 
    fill_in "Password Confirmation",	with: "" 
    click_button "Sign Up"


    #expect(page).to have_content("You have not signed up successfully") 
  end
end