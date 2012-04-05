class Document < ActiveRecord::Base
	validates :description, :issue, :department, :company, :presence => true

	before_save :default_values

	belongs_to :issue
	belongs_to :department
	belongs_to :company

	def default_values
		self.status ||= "Disponivel"
	end
  
 	def search
	    Document.find(:all, :conditions => conditions)
	end

	def description_conditions
		["description LIKE ?", "%#{description}%"] unless description.blank?
	end

	def issue_conditions
		["issue_id = ?", "#{issue.id}"] unless issue.blank? || issue.id.blank?
	end

	def company_conditions
		["company_id = ?", "#{company.id}"] unless company.blank? || company.id.blank?
	end

	def department_conditions
		["department_id = ?", "#{department.id}"] unless department.blank? || department.id.blank?
	end


	def conditions
	  [conditions_clauses.join(' AND '), *conditions_options]
	end

	def conditions_clauses
	  conditions_parts.map { |condition| condition.first }
	end

	def conditions_options
	  conditions_parts.map { |condition| condition[1..-1] }.flatten
	end

	def conditions_parts
	  methods.grep(/_conditions$/).map { |m| send(m) }.compact
	end
end
