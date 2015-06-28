class Review < ActiveRecord::Base
	validates :rating, presence: true, numericality: {greater_than: 0, message: "Has to be 1 or greater", less_than: 6, message: "Has to be less than or equal to 5" }
	validates :review, presence: true
	belongs_to :restaurant
end