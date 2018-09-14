class Booking < ApplicationRecord
	#has_many :tickets
	belongs_to :flight , optional: true
	has_many :passenger_bookings
	has_many :passengers, through: :passenger_bookings
	
	

	accepts_nested_attributes_for :passengers
end
