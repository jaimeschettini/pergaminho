class Document < ActiveRecord::Base
	validates :description, :issue, :department, :company, :status, :presence => true
	#validates :status, :inclusion => STATUS_TYPES


	belongs_to :issue
	belongs_to :department
	belongs_to :company
end
