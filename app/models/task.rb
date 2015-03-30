class Task < ActiveRecord::Base
	belongs_to :principal, :class_name => "User" # Auftraggeber
	belongs_to :agent, :class_name => "User" # Auftragnehmer
	has_many :offers
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :technologies
	has_many :questions
	has_one :calculation
	has_one :location, as: :resident
	has_many :attachments, as: :attachable
	accepts_nested_attributes_for :attachments

	ratyrate_rateable "overall"

	validates :title, presence: true
end
