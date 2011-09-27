Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
    User.new(:email => email,
             :password => password,
             :password_confirmation => password).save!

    visit new_user_session_path
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_button "Sign in"
end