class Registration < ActiveRecord::Base
	belongs_to :product

	validates :email,
		:confirmation => true,
    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
	validates :first_name,
		:presence => true
	validates :last_name,
		:presence => true
	validates :parent_first_name,
		:presence => true
	validates :parent_last_name,
		:presence => true
	validates :grade,
		:presence => true
	validates :school,
		:presence => true
	validates :tshirt_size,
		:presence => true
	validates :product_id,
		:presence => true
	validates :parent_tshirt_size,
		:presence => { :if => :parent_helper, :message => 'required for parent helpers' }
	validates :waiver, 
		:acceptance => { :accept => true, :message => 'of liability must be accepted' }
end
