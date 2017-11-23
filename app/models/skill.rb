class Skill < ApplicationRecord
	has_many :employee_skills
	has_many :employees, through: :employee_skills


	validates :name, presence: true

	before_destroy :confirm_not_have_employee_skills

	########## METODOS DE CLASE #####################
	def self.order_by_name
		order(:name)
	end

	private
	def confirm_not_have_employee_skills
		if self.employee_skills.count > 0
			errors.add(:base,'No puede eliminarlo. Tiene trabajadores asociados')
			throw :abort
			return false
		end
	end
end
