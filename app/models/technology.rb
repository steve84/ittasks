class Technology < ActiveRecord::Base
	has_and_belongs_to_many :tasks
end
