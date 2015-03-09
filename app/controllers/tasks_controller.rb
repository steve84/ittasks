class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
	before_action :get_all_categories, only: [:show, :edit, :update, :new]
	before_action :get_all_offers, only: [:show]

	def new
		@task = Task.new
	end

	def create
		if user_signed_in?
			@task = Task.new(task_params)
			@task.principal_id = current_user.id

			category_ids = category_params
			category_ids.each do |id|
				if id != ""
					@task.categories << Category.where("id = ?", id).first
				end
			end

			if @task.save
				redirect_to tasks_path
			end
		else
			redirect_to new_user_session_path
		end
	end

	def show
	end

	def index
		@tasks = Task.page(params[:page]).per(5)
	end

	def my_tasks
		if user_signed_in?
			@tasks = Task.where("principal_id = ?", current_user.id).page(params[:page]).per(5)
		else
			redirect_to new_user_session_path
		end
	end

	def edit
	end

	def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
	end

	def destroy
		@task.destroy
		redirect_to tasks_path, notice: 'Task was successfully destroyed.'
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :duration, :title)
    end

		def get_all_categories
			@categories = Category.all			
		end

		def get_all_offers
    	@offers = Offer.where("task_id = ?", params[:id])		
		end

    def category_params
      params[:category][:id]
    end
end
