class Location < ActiveRecord::Base
	belongs_to :resident, polymorphic: true

	geocoded_by :address
	after_validation :geocode, :if => :street_changed?

	def address
  [street, city, country].compact.join(', ')
	end
end
