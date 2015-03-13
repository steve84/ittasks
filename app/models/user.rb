class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :tasks
	has_many :offers
	has_one :location
	has_one :role

	after_create :default_role


	private
		def default_role
			if self.role_id.nil?
				self.update_attributes(:role_id => Ittasks::Application::USER_ROLE)
			end
		end
end
