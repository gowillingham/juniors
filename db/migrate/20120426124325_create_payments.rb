class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :registration_id, :null => false
      t.integer :amount, :default => 0
      t.boolean :online, :default => false
      t.boolean :scholarship, :default => false
      t.string :paypal_txn_id
      t.string :paypal_txn_type
      t.string :paypal_mc_fee
      t.string :paypal_sandbox
      t.string :paypal_payment_status
      t.string :paypal_pending_status_reason
      t.string :paypal_payment_type
      t.string :paypal_verify_sign
      t.string :paypal_payer_status

      t.timestamps
    end
  end
end
