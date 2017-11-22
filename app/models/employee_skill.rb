class EmployeeSkill < ApplicationRecord
  belongs_to :employee
  belongs_to :skill

  validates :skill_id, uniqueness: {scope: :employee_id }
end
