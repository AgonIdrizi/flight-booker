class Booking < ApplicationRecord
	#has_many :tickets
	belongs_to :flight , optional: true
	has_many :passenger_bookings  
	has_many :passengers, through: :passenger_bookings , dependent: :destroy
	
	before_save :reject_if_nested_atributes_are_blank
	

	accepts_nested_attributes_for :passengers,  reject_if: :reject_nested_blank_attr , allow_destroy: true

	private

	def reject_nested_blank_attr(att)
	  att[:email].blank?
	end

	def reject_if_nested_atributes_are_blank
	  if self.passenger_bookings.empty?
	  	self.destroy
	  end
	end


end
