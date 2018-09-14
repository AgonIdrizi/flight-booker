class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by(id: params[:flight][:id])
		@booking = Booking.new
		params[:passenger].to_i.times { @booking.passengers.build }

		
				
	end

	def show
		@booking = Booking.find_by(id: params[:id])
		@flight = @booking.flight
	end

	def create
		@flight = Flight.find(booking_params[:flight_id])
		@booking = Booking.new(flight_id: booking_params[:flight_id]) 

		booking_params[:passengers_attributes].each do |k,v|
			@booking.passengers.build(name: params[:booking][:passengers_attributes][k][:name],
									  email: params[:booking][:passengers_attributes][k][:email])
		end
		if @booking.save
			flash[:success] = "Booking successful"
			redirect_to booking_path(@booking)
		else
			flash[:danger] = "Flight booking error!"
			render 'new'
		end

	end

	def index
	end


	private

		def booking_params
		  params.require(:booking).permit(:flight_id, :passengers_attributes => [:name,:email])
		end

	  
end
