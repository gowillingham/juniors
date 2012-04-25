class Product < ActiveRecord::Base
	attr_accessible :name, :description, :enabled, :category, :price
	
	has_many :registrations

	validates :name,
		:presence => true
end
