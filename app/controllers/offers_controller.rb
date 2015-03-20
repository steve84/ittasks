class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
	before_action :get_number_of_offers_per_user, only: [:show, :index]
	before_action :create_offer, only: :create #workaround for cancan

	load_and_authorize_resource

  # GET /offers
  # GET /offers.json
  def index
  end

  def my_offers
		if user_signed_in?
	    @offers = Offer.where("user_id = ?", current_user.id)
		else
			redirect_to new_user_session_path
		end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
		@offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
		@offer.task_id = params[:task_id]
		@offer.user_id = current_user.id

    respond_to do |format|
      if @offer.save
        format.html { redirect_to task_offers_path(@offer.task_id), notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to task_offers_path(@offer.task_id), notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to task_offers_path(params[:task_id]), notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def accept
		if user_signed_in?
			@task = Task.find(params[:task_id])
			if @task.agent_id.eql?(nil) && current_user.id != @task.principal_id && params.keys().include?('selected_offer')
				@offer = Offer.find(params[:selected_offer])
				@task.agent_id = @offer.user_id
				@task.save
			else
				redirect_to task_path(params[:task_id])
			end
		end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:remark, :amount)
    end

		def create_offer
	    @offer = Offer.new
		end

		def get_number_of_offers_per_user
		  @offers = Offer.where("task_id = ?", params[:task_id])
			@task = Task.find(params[:task_id])
			if user_signed_in?
				@number_of_offers = @offers.where("user_id = ?", current_user.id).count()
			else
				@number_of_offers = 0
			end
		end
end
