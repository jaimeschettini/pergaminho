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
 		puts "jaimeeeeeeee"
 		puts description.blank?
	    Document.find(:all, :conditions => conditions)
	end

	def description_conditions
		puts "description"
		["description LIKE ?", "%#{description}%"] unless description.blank?
	end

	def issue_conditions
		puts "issue"
		["description LIKE ?", "%#{description}%"] unless description.blank?
	end

	def conditions
		puts "11111"
	  [conditions_clauses.join(' AND '), *conditions_options]
	end

	def conditions_clauses
		puts "22222"
	  conditions_parts.map { |condition| condition.first }
	end

	def conditions_options
		puts "3333"
	  conditions_parts.map { |condition| condition[1..-1] }.flatten
	end

	def conditions_parts
		puts "4444"
		puts methods.grep(/_conditions$/).length
		puts "44445555555"
	  methods.grep(/_conditions$/).map { |m| send(m) }.compact
	end
end
