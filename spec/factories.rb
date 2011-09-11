FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    email       { Factory.next(:email) }
    password    'passwOrd'
    password_confirmation { password }
  end

end