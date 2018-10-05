class PassengerMailer < ApplicationMailer
  def new_booking(passenger)
  	@passenger = passenger
  	@booking = @passenger.bookings.first
    mail(to: @passenger.email, subject: 'New booking')
    end
  
end
