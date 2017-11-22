class Api::V1::EmployeeSkillsController < ApplicationController
	before_action :set_employee, only: [:index, :create]
	before_action :set_employee_skill, only: [:destroy]

	def index
		@skills = Skill.order_by_name
		@employee_skills = @employee.employee_skills
		puts @skills.inspect
		render "api/v1/employee_skills/index"
	end

	def create
		@employee_skill = EmployeeSkill.new
		@employee_skill.employee = @employee
		@employee_skill.skill_id = params[:skill_id]

		if @employee_skill.save
			render "api/v1/employee_skills/show"
		else
			puts @employee_skill.errors.full_messages.inspect
			render json: {error: @employee_skill.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		@employee_skill.destroy

		render "api/v1/employee_skills/show"
	end
	
	private
	def set_employee
		@employee = Employee.find(params[:employee_id])
	end

	def set_employee_skill
		@employee_skill = EmployeeSkill.find(params[:id])
	end
end