class Issue < ActiveRecord::Base
	has_many :documents
	belongs_to :group

	validates :description, :group_id, :presence => true
end
