class Flight < ApplicationRecord
	belongs_to :from_airport, foreign_key: 'start_airport_id', class_name: 'Airport', optional: true
	belongs_to :to_airport , foreign_key: 'finish_airport_id', class_name: 'Airport', optional: true

	
	def self.get_flight_dates # grabs out existing date flights
	flight_dates = Flight.find_by_sql("select distinct start_date from flights where
														 start_date is not null order by start_date asc")
	end

	def start_date_formated #formats the date
	  start_date.strftime("%d/%m/%Y")
	end

	def self.search(params) # search flights by submited params from search-form
		date = params[:start_date].to_date


	  where("start_airport_id = ? AND finish_airport_id = ? OR start_date = ?",
	   params[:from], params[:to], date)
	end

end