class Attachment < ActiveRecord::Base
	has_attached_file :flat
	belongs_to :attachable, polymorphic: true
end
