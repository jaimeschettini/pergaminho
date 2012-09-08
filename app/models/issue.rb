class Issue < ActiveRecord::Base
	has_many :documents
	validates :description, :presence => true
end
