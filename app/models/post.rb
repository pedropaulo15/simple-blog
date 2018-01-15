class Post < ApplicationRecord
	has_many :comments # It says that a post has many comments
	# Validation on the title field from the form
	validates :title, presence: true, # This sets this field as mandatory
						length: {minimum: 5} # This sets the minimum length as 5 characteres
end
