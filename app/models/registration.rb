class Registration < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :parent_first_name, :parent_last_name, :email, :email_confirmation, :address, :city, :state, :zip, 
		:phone, :tshirt_size, :parent_tshirt_size, :school, :grade, :parent_helper, :waiver, :volleyball, :note, :product_id

	belongs_to :product

	validates :email,
		:confirmation => true,
    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :phone, 
    :format => { :with => /^[\(\)0-9\- \+\.]{10,20}$/ }
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

	def name
		"#{first_name} #{last_name}"
	end
end
