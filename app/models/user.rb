class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :email, :name, :phone, :password, :password_confirmation

  validates :username, :name, :password, :presence => true
  validates :username, :password, :length => { :minimum => 3 }
  validates :password, :confirmation => true
end
