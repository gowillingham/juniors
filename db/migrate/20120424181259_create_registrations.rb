class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :parent_first_name, :null => false
      t.string :parent_last_name, :null => false
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :tshirt_size
      t.string :parent_tshirt_size
      t.string :school
      t.string :grade
      t.string :note
      t.boolean :waiver, :default => false
      t.boolean :parent_helper, :default => false
      t.boolean :volleyball, :default => false
      t.integer :product_id, :null => false

      t.timestamps
    end
  end
end
