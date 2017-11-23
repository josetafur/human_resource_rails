class Api::V1::SkillsController < ApplicationController
	before_action :set_skill, only: [:update, :destroy]

	def index
		@skills = Skill.all
	end

	def create
		@skill = Skill.new(skill_params)

		if @skill.save
			render "api/v1/skills/show"
		else
			render json: { error: @skill.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		if @skill.update(skill_params)
			render "api/v1/skills/show"
		else
			render json: { error: @skill.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		if @skill.destroy
			render "api/v1/skills/show"
		else
			render json: { error: @skill.errors.full_messages }, status: :unprocessable_entity
		end

	end

	private
	def set_skill
		@skill = Skill.find(params[:id])
	end

	def skill_params
		params.require(:skill).permit(:name)
	end
end