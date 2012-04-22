class Group < ActiveRecord::Base
	has_many :documents
	has_many :issues
	has_many :departments
	has_many :companies

	validates :name, :presence => true
end
