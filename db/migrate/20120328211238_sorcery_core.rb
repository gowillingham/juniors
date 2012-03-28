class SorceryCore < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :crypted_password
      t.remove :salt
    end
  end
end