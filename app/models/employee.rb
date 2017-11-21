class Employee < ApplicationRecord
	# enum :state, [:enable,:disable]

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
	
	########## METODOS DE PRIVADOS #####################
	private
	def set_defaults
		self.state = 0
	end

end

