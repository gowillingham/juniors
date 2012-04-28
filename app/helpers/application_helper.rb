module ApplicationHelper
	def dollarify(i)
		number_to_currency(i * 0.01)
	end
end
