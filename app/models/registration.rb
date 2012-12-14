class Registration < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :parent_first_name, :parent_last_name, :email, :email_confirmation, :address, :city, :state, :zip, 
		:phone, :tshirt_size, :parent_tshirt_size, :school, :grade, :parent_helper, :waiver, :volleyball, :note, :product_id

	belongs_to :product
	has_many :payments, :dependent => :destroy

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

	def balance
		self.product.price - self.payments.inject(0) { |sum, payment| sum + payment.amount }
	end

	def name
		"#{first_name} #{last_name}"
	end

	def parent_name
		"#{parent_first_name} #{parent_last_name}"
	end

	def has_address?
		# checks for any missing address elements ..
		[self.address, self.city, self.zip].all? { |i| !i.blank? }
	end 

	def full_street_address
		if self.has_address?
			"#{self.address}\n#{self.city}, #{self.state} #{self.zip}"
		end
	end

	def total_price
		if self.volleyball?
		  self.product.price + LITE_VOLLEYBALL_PRICE_IN_CENTS
		else
			self.product.price
		end
	end
end
