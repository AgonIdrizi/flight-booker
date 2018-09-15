class Passenger < ApplicationRecord
	#has_many :tickets , foreign_key: 'passenger_id'
	has_many :passenger_bookings, dependent: :destroy
	 has_many :bookings, through: :passenger_bookings , dependent: :destroy
	 
	has_many :flights ,through: :bookings
end
