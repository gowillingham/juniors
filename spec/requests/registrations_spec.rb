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

					response.should render_template('registrations/show')
					response.should have_selector('p.alert-success', :content => 'Registration was successfully created.')
				end.should change(Registration, :count).by(1)
			end
		end

		describe "failure" do
			it "should not create a registration" do
				lambda do
					visit 'registrations/new'
					fill_in 'registration_product_id', 					:with => @product.id
					fill_in 'registration_first_name', 					:with => nil
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
					
					response.should render_template('registrations/new')
					response.should have_selector('div.alert-error')
				end.should change(Registration, :count).by(0)
			end
		end
	end

	describe "GET /update" do
		before(:each) do
			@user = Factory(:user)
			visit signin_path
			fill_in "Email", 			:with => @user.email
			fill_in "Password", 	:with => 'password'
			click_button

			@registration = Registration.create!(
				:product_id => @product.id,
				:first_name => 'first_name',
				:last_name => 'last_name',
				:parent_first_name => 'parent_first_name',
				:parent_last_name => 'parent_last_name',
				:email => 'gowillingham@gmail.com',
				:email_confirmation => 'gowillingham@gmail.com',
				:phone => '9524316341',
				:address => '21266 Inspiration path',
				:city => 'Lakeville',
				:state => 'MN',
				:zip => '55044',
				:tshirt_size => 'YL',
				:school => 'NA',
				:grade => '4',
				:note => 'note for admin',
				:parent_tshirt_size => 'L',
				:parent_helper => true,
				:waiver => true,
				:volleyball => true
			)
		end

		describe "success" do
			it "should update the registration attributes" do
				visit edit_registration_path(@registration)
				fill_in 'registration_first_name', :with => 'the_new_name'
				fill_in 'registration_email_confirmation', :with => @registration.email
				fill_in 'registration_product_id', :with => @registration.product.id
				click_button

				response.should have_selector('.booger')


				response.should render_template('registrations/show') 
			end
		end

		describe "failure" do
			it "should not update the product attributes"
		end
	end

end
