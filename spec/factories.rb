require 'faker'

Factory.sequence :email do |n|
  "user_##{n}@example.com"
end

Factory.define :user do |user|
	user.name Faker::Name.name
  user.password 'password'
  user.password_confirmation 'password'
  user.email { Factory.next(:email) }
end

