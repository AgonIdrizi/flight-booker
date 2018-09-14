class Passenger < ApplicationRecord
	#has_many :tickets , foreign_key: 'passenger_id'
	has_many :passenger_bookings
	 has_many :bookings, through: :passenger_bookings
	 
	has_many :flights ,through: :bookings
end
