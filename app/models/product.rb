class Product < ActiveRecord::Base
	attr_accessible :name, :description, :enabled, :category, :price, :code
	
	has_many :registrations

	validates :name,
		:presence => true
end
