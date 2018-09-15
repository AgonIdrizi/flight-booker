class Booking < ApplicationRecord
	#has_many :tickets
	belongs_to :flight , optional: true
	has_many :passenger_bookings
	has_many :passengers, through: :passenger_bookings , dependent: :destroy
	
	

	accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: proc { |att| att['email'].blank? }
end
