class Registration < ActiveRecord::Base
	
	validates :email,
		:confirmation => true
end
