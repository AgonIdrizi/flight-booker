# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

	

	def new_booking
		passenger = Passenger.find(13)
		PassengerMailer.new_booking(passenger)
	end
end
