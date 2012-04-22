class Department < ActiveRecord::Base
	has_many :documents
	belongs_to :group

	validates :name, :group_id, :presence => true
end
