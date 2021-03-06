class Payment < ActiveRecord::Base
	belongs_to :registration

	validates :registration_id,
		:presence => true	

  def receive_paypal_payment(params_hash, notify)
    registration = Registration.find(registration_id)
    received = false
    
    if (notify.acknowledge || !Rails.env.production?)
      begin 
        if !(params_hash[:payment_status] == PAYPAL_COMPLETED)
          Rails.logger.info "PAYPAL_TXN: transaction did not return #{PAYPAL_COMPLETED}"
        elsif registration.total_price.to_s != params_hash[:mc_gross].gsub(".", "")
          Rails.logger.info "PAYPAL_TXN: registration.total_price:#{registration.total_price} <> mc_gross:#{params_hash[:mc_gross]} returned by paypal"
        else
          self.update_attributes(
            :paypal_txn_id => params_hash[:txn_id],
            :paypal_payment_status => params_hash[:payment_status],
            :paypal_pending_status_reason => params_hash[:pending_reason],
            :paypal_txn_type => params_hash[:txn_type],
            :paypal_payment_type => params_hash[:payment_type],
            :paypal_verify_sign => params_hash[:verify_sign],
            :paypal_payer_status => params_hash[:payer_status],
            :paypal_mc_fee => params_hash[:mc_fee],
            :amount => params_hash[:mc_gross].gsub(".", ""),
            :online => true
          )

       		Rails.logger.info "PAYPAL_TXN: Accepted payment #{amount} for registration_id #{registration_id}"

          received = true
        end
      rescue => e
        Rails.logger.info "PAYPAL_TXN: A problem in notify.acknowledge block"
      ensure
        save
      end
    else
      Rails.logger.info "PAYPAL_TXN: this transaction was not acknowleged by paypal"
    end
    
    return received
  end

  def paid?
    if scholarship
      true
    else
      if amount.nil?
        false
      elsif amount == 0
        false
      else
        true
      end
    end
  end
end
