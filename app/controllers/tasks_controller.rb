class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
	before_action :get_all_categories, only: [:new]
	before_action :get_all_offers, only: [:show]
	before_action :get_task_categories, only: [:show, :edit, :update]
	before_action :get_number_of_offers_per_user, only: :show
	before_action :create_task, only: :create #workaround for cancan

	load_and_authorize_resource

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
			db_category_ids = @categories.ids.map(&:to_s).sort
			form_category_ids = params[:task][:category_ids].sort - [""]
			category_ids_to_add = form_category_ids - db_category_ids
			category_ids_to_del = db_category_ids - form_category_ids

			category_ids_to_add.each() do |id|
				@task.categories << Category.where("id = ? ", id).first
			end
			category_ids_to_del.each() do |id|
				@task.categories.destroy(Category.where("id = ? ", id).first)
			end
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

		def get_task_categories
			@categories = @task.categories
		end

		def get_all_offers
    	@offers = Offer.where("task_id = ?", params[:id])		
		end

    def category_params
      params[:category][:id]
    end

		def create_task
			@task = Task.new
		end

		def get_number_of_offers_per_user
		  @offers = Offer.where("task_id = ?", params[:id])
			if user_signed_in?
				@number_of_offers = @offers.where("user_id = ?", current_user.id).count()
			else
				@number_of_offers = 0
			end
		end
end
