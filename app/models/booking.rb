class Booking < ApplicationRecord
	
	belongs_to :flight , optional: true
	has_many :passenger_bookings  
	has_many :passengers, through: :passenger_bookings , dependent: :destroy
	has_many :tickets
	after_save :create_tickets
	
	

	accepts_nested_attributes_for :passengers, allow_destroy: true
	def create_tickets #creates ticket for each passenger of that booking
		self.passengers.each do |passenger|
		  self.tickets.create!(passenger_id: passenger.id)
		end
	end
	private

	

	def reject_nested_blank_attributes(att)
	  att[:email].blank?
	end

	


end
