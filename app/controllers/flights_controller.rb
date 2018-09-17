class FlightsController < ApplicationController
	def index
	  @airport_options = Airport.all
	  @passengers = params[:passengers]
	  if params.to_s.blank?
	    redirect_to root_path
	  else
	    @flights = Flight.search(params)
	    flash.now[:danger] = 'Nothing found' if @flights.length == 0 && !params[:commit].to_s.blank?
	 	flash.now[:danger] = 'Airports codes must be different' if Flight.check_for_same_airport_values(params)	 	  	
		render 'index'
	  end	    	    
	end

end
