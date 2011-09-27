FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    email       { Factory.next(:email) }
    password    'passwOrd'
    password_confirmation { password }
  end

  factory :group do
    title "group's title"
  end

  factory :article do
    title  "comment's' title"
    body   "comment's body"
    author { Factory(:user) }
  end
end