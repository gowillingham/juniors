class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email,
  	:presence => true,
  	:uniqueness => true,
    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :password,
  	:presence => { :on => :create },
  	:confirmation => true
end
