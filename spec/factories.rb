require 'faker'

Factory.sequence :email do |n|
  "user_##{n}@example.com"
end

Factory.define :user do |user|
	user.name 									Faker::Name.name
  user.password 							'password'
  user.password_confirmation 	'password'
  user.email 									{ Factory.next(:email) }
end

Factory.define :product do |product|
	product.name 				'product_name'
	product.description 'product_description'
	product.category 		'product_category'
	product.price 			7000
	product.enabled 		true
end

Factory.define :registration do |registration|
	last_name = Faker::Name.last_name
  registration.first_name						Faker::Name.first_name
  registration.last_name						last_name
  registration.parent_first_name		Faker::Name.first_name
  registration.parent_last_name			last_name
  registration.email								Faker::Internet.email
  registration.address							'address'
  registration.phone								'999 999 9999' 
  registration.city									'city'
  registration.state								'state' 
  registration.tshirt_size					'YL'
  registration.parent_tshirt_size		'XL' 
  registration.grade								'5' 
  registration.school								'school' 
  registration.note									'note'
  registration.waiver								true
  registration.parent_helper				false 
  registration.volleyball						true						
end

Factory.define :payment do |payment|
  payment.amount         0
  payment.online         false
  payment.scholarship    false
end

