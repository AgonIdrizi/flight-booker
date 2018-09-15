class FlightsController < ApplicationController
	def index
		@airport_options = Airport.all
	 if !params.empty?
	   @flights = Flight.search(params)
		#debugger
	 else
		render 'index'
	 end
	 @passengers = params[:passengers]
		
	end


	

	#params.require(:flight).permit(:start_airport_id,:finish_airport_id)
end
