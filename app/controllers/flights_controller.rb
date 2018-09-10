class FlightsController < ApplicationController
	def index
	 @flights = Flight.search(params)
		#debugger
		
	end


	

	#params.require(:flight).permit(:start_airport_id,:finish_airport_id)
end
