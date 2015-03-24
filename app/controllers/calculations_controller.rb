class CalculationsController < ApplicationController
  before_action :get_tasks, only: :my_calculations	

	def my_calculations
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_tasks
			if user_signed_in?
				@tasks = Task.where('principal_id = ?', current_user.id).page(params[:page]).per(5)
			end
    end
end
