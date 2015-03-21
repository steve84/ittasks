class Task < ActiveRecord::Base
	belongs_to :principal, :class_name => "User" # Auftraggeber
	has_one :agent, :class_name => "User" # Auftragnehmer
	has_many :offers
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :technologies
	has_many :questions
	has_one :calculation
	has_one :location
	has_one :rating
	has_many :attachments, as: :attachable

	validates :title, presence: true
end
