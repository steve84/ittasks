class Attachment < ActiveRecord::Base
	has_attached_file :flat
	validates_attachment_content_type :flat, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	belongs_to :attachable, polymorphic: true
end
