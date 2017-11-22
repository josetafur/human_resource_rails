class Employee < ApplicationRecord
	has_many :employee_skills
	has_many :skills, through: :employee_skills

	validates :name, :last_name, :job_position, :team, presence: true
	validates :phone, numericality: {only_integer: true}, :allow_blank => true
	
	before_validation :set_defaults, on: :create


	########## METODOS DE CLASE #####################
	def self.lasted
		order(id: :desc)
	end

	def self.filter_by_term(term)
		where("name LIKE ?","%#{term}%")
	end

	def self.filter_by_skills(skills)
		joins(:employee_skills).where("employee_skills.skill_id IN (?)",skills).group("employees.id").having("count(employee_skills.id) >= ?",skills.length)
	end

	########## METODOS DE PRIVADOS #####################
	private
	def set_defaults
		self.state = 0
	end

end

