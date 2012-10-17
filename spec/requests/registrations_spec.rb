require 'spec_helper'

describe "Registrations" do
	before(:each) do
		@product = Factory(:product)
	end

	describe "GET /new" do
		describe "success" do
			it "should create a registration" do	
				lambda do
					visit 'registrations/new'
					fill_in 'registration_product_id', 					:with => @product.id
					fill_in 'registration_first_name', 					:with => 'first_name'
					fill_in 'registration_last_name', 					:with => 'last_name'
					fill_in 'registration_parent_first_name', 	:with => 'parent_first_name'
					fill_in 'registration_parent_last_name', 		:with => 'parent_last_name'
					fill_in 'registration_email',								:with => 'gowillingham@gmail.com'
					fill_in 'registration_email_confirmation', 	:with => 'gowillingham@gmail.com'
					fill_in 'registration_phone', 							:with => '9524316341'
					fill_in 'registration_address', 						:with => '21266 Inspiration path'
					fill_in 'registration_city', 								:with => 'Lakeville'
					fill_in 'registration_state', 							:with => 'MN'
					fill_in 'registration_zip', 								:with => '55044'
					fill_in 'registration_tshirt_size', 				:with => 'YL'
					fill_in 'registration_school', 							:with => 'NA'
					fill_in 'registration_grade', 							:with => '4'
					fill_in 'registration_note', 								:with => 'note for admin'
					fill_in 'registration_parent_tshirt_size', 	:with => 'L'
					check 'Parent helper?'
					check 'Read and agree to waiver?'
					check 'Include lite volleyball?'
					click_button

					save_and_open_page
					response.should render_template('registrations/show')
					response.should have_selector('p.alert-success', :content => 'Registration was successfully created.')
				end.should change(Registration, :count).by(1)
			end
		end

		describe "failure" do
			it "should not create a registration"
		end
	end

	describe "GET /update" do
		before(:each) do

		end

		describe "success" do
			it "should update the registration"
		end

		describe "failure" do
			it "should not update the product attributes"
		end
	end

end
