class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  # :confirmable
  include DeviseTokenAuth::Concerns::User

  before_validation :check_if_is_the_first_user, on: :create
  #before_validation :check_user_is_the_first

  def check_if_is_the_first_user
  	if source != 1 && User.count > 0
  		errors.add(:base,'No puede crear usuarios')
  		throw :abort
      return false
  	end
  end


end
