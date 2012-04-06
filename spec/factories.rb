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

Factory.define :product do |product|
	product.name 'product_name'
	product.description 'product_description'
	product.category 'product_category'
	product.price 7000
	product.enabled true
end

