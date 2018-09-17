class BookingsController < ApplicationController
	

	def new
	  if params[:flight].nil? #user must select a flight otherwise will be redirected with a flash message
		flash[:danger] = "You must select a flight"
		redirect_back fallback_location: root_path
	  else
		@flight = Flight.find_by(id: params[:flight])
	    @booking = Booking.new
		params[:passengers].to_i.times { @booking.passengers.build }
	  end			
	end

	def show
		@booking = Booking.find_by(id: params[:id])
		@flight = @booking.flight
	end

	def create
		@flight = Flight.find(booking_params[:flight_id])
		@booking = Booking.new(booking_params) 

		if @booking.save 
			flash[:success] = "Booking successful"
			redirect_to booking_path(@booking)
		else
			flash.now[:danger] = "Flight booking error!You must enter passenger infos, GO Back"
			render 'new'
		end

	end

	def edit
		@booking = Booking.find_by(id: params[:id])

		@booking.passengers
	end

	def update
		@booking = Booking.find_by(id: params[:id])
		#@booking.passengers.update_attributes(params[:booking][:passengers_attributes])
		
		if @booking.update!(booking_params)
		  flash[:success] = "Booking successfuly updated"
			redirect_to booking_path(@booking)
		else
			flash[:danger] = "update booking error!"
			render 'new'
		end

	end

	def index
	end


	private

		def booking_params
		  params.require(:booking).permit(:flight_id, :passengers_attributes => [:id,:name,:email])
		end

	  
end
