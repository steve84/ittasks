prawn_document(:page_layout => :portrait, :filename => @filename) do |pdf|
	pdf.text "Calculation"
	pdf.move_down 20
	pdf.table([ ["Task ID", @calculation.task.id.to_s()],
							["Task Title",  @calculation.task.title],
							["Task Description", @calculation.task.description],
							["Accepted Offer", @offer.amount.to_s()],
							["Calculation ID", @calculation.id.to_s()],
							["To Pay", @calculation.amount.to_s()],
							["State", @calculation.state] ])
end
