class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :name, :phone, :password, :password_confirmation

  validates_length_of :password, :minimum => 3, :if => :password
  validates_confirmation_of :password, :if => :password
end
