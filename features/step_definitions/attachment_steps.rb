Given /^I enter attachment details$/ do
  attach_file('user_avatar', "#{Rails.root}/features/fixtures/test.jpg")
  click_button('Save Avatar')
end

Given /^I have an avatar$/ do
  Given %{I go to my_profile page}
  And %{I enter attachment details}
end

Given /^the avatar added$/ do
  User.last.avatar_url.should_not be_empty
end

Then /^I should see button "([^"]*)"$/ do |text|
  page.should have_button(text)
end