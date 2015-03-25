class CalculationsController < ApplicationController
  before_action :get_tasks, only: :my_calculations
	before_action :get_calculation, only: :create_pdf

	def my_calculations
	end

	def create_pdf
		@filename = 'calculation_' + @calculation.id.to_s() + '.pdf'
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_tasks
			if user_signed_in?
				@tasks = Task.where('principal_id = ?', current_user.id).page(params[:page]).per(5)
			end
    end

		def get_calculation
			if user_signed_in?
				@calculation = Calculation.find(params[:id])
				@task = @calculation.task
				@offer = @task.offers.where('user_id = ?', @task.agent_id).first()
			end
		end
end
