class Api::V1::EmployeesController < ApplicationController
	before_action :set_employee, only: [:show,:update,:destroy]

	def index
		@employees = Employee.lasted
		if params[:skills].present?
			@employees = @employees.filter_by_skills(params[:skills])
			puts @employees.inspect
		end
		render "api/v1/employees/index"
	end

	def create
		@employee = Employee.new(employee_params)

		if @employee.save
			render "api/v1/employees/show"
		else
			render json: {error: @employee.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def show
		render "api/v1/employees/show"
	end

	def update
		if @employee.update(employee_params)
			render "api/v1/employees/show"
		else
			render json: {error: @employee.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		@employee.update(state: 1)
		render "api/v1/employees/show"
	end

	def autocomplete
		@employees = Employee.filter_by_term(params[:term])
		render "api/v1/employees/index"
	end

	private
	def set_employee
		@employee = Employee.find(params[:id])
	end

	def employee_params
		params.require(:employee).permit(:name,:last_name,:phone,:job_position,:team)
	end
end