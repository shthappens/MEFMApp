require 'rails_helper'

feature "user can sign up when filling form out correctly" do

  scenario 'a properly filled out form can create a user' do
    visit physicians_path
    click_link "Sign up"
    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Grossman"
    fill_in "Email", with: "test@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Logout")
    expect(page).to_not have_content ("First name can't be blank")
    expect(page).to_not have_content ("Last name can't be blank")
    expect(page).to_not have_content ("Email can't be blank")
  end

  scenario 'a user who does not give their name can not sign up' do
    visit physicians_path
    click_link "Sign up"
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: "test@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign up"

    expect(page).to_not have_content("Logout")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'A user who does not provide an email can not sign up' do
    visit physicians_path
      click_link "Sign up"
      fill_in "First Name", with: "Matt"
      fill_in "Last Name", with: "Grossman"
      fill_in "Email", with: ""
      fill_in "user_password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_button "Sign up"

      expect(page).to_not have_content("Logout")
      expect(page).to have_content("Email can't be blank")
  end

  scenario "A user can log out succesfully" do
    visit physicians_path
    click_link "Sign up"
    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Grossman"
    fill_in "Email", with: "test@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign up"
    click_link("Logout")

    expect(page).to_not have_content("Logout")
  end
end
