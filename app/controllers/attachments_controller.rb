class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:destroy]

	def destroy
		@attachable = @attachment
		@attachment.destroy
		if @attachable.attachable_type.eql?('Task')
			redirect_to edit_task_path(@attachable.attachable_id), notice: 'Attachment was successfully destroyed.'
		else
			redirect_to tasks_path, notice: 'Attachment was successfully destroyed.'
		end	
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end
end
