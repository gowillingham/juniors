class Product < ActiveRecord::Base
	has_many :registrations
	
	validates :name,
		:presence => true
end
