class Flight < ApplicationRecord
	belongs_to :from_airport, foreign_key: 'start_airport_id', class_name: 'Airport', optional: true
	belongs_to :to_airport , foreign_key: 'finish_airport_id', class_name: 'Airport', optional: true
	has_many :bookings
	has_many :passengers , through: :bookings

	before_save :convert_DateTime_to_Date_and_extract_hour_part
	
	def self.get_flight_dates # grabs out existing date flights
	flight_dates = Flight.find_by_sql("select distinct start_date from flights where
														 start_date is not null order by start_date asc")
	end

	def start_date_formated #formats the date
	  start_date.strftime("%d/%m/%Y")
	end

	def self.search(params) # search flights by submited params from search-form
		date = params[:start_date]
		if date.nil?
			date = DateTime.now
		else
			date = params[:start_date].to_date
		end
		

	   where("start_airport_id = ? AND finish_airport_id = ? OR start_date BETWEEN ? AND ?",
	   params[:from], params[:to], date.beginning_of_day, date.end_of_day)
	end

	def convert_DateTime_to_Date_and_extract_hour_part
		self.start_hour = start_date.to_formatted_s(:time)
		self.start_date = start_date.to_date

	end

end