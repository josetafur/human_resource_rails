class Api::V1::UsersController < ApplicationController

	def index
		@users = User.all
		render "api/v1/users/index"
	end

	def create
		@user = User.new(user_params)
		@user.password = Devise.friendly_token
		@user.password_confirmation = @user.password
		@user.source = 1

		if @user.save
			render "api/v1/users/show"
		else
			render json:{error: @user.errors.fulls_messages}
		end
	end

	private
	def user_params
		params.require(:user).permit(:email)
	end

end