class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.boolean :enabled
      t.integer :price

      t.timestamps
    end
  end
end
