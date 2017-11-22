class Skill < ApplicationRecord
	has_many :employee_skills
	has_many :employees, through: :employee_skills

	def self.order_by_name
		order(:name)
	end
end
