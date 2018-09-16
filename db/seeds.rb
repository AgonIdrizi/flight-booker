


def generate_code(number) #creates random 3 strings for airport-code
  charset = Array('A'..'Z') + Array('A'..'Z')
  Array.new(number) { charset.sample }.join
end


5.times do |n|
code = generate_code(3)
Airport.create!(airport_code: code)
end

Airport.find(1).departing_flights.create!(finish_airport_id:5,
 start_date:'2018-09-18 14:00:00',start_hour:'', flight_duration:'01:30')

Airport.find(2).departing_flights.create!(finish_airport_id:1,
 start_date:'2018-09-20 14:00:00',start_hour:'', flight_duration:'05:00')

Airport.find(1).departing_flights.create!(finish_airport_id:2,
 start_date:'2018-09-18 14:00:00',start_hour:'', flight_duration:'05:00')

Airport.find(3).departing_flights.create!(finish_airport_id:4,
 start_date:'2018-09-18 10:00:00',start_hour:'', flight_duration:'05:10')

Airport.find(3).departing_flights.create!(finish_airport_id:2,
 start_date:'2018-09-20 17:00:00',start_hour:'', flight_duration:'05:00')


Airport.find(3).departing_flights.create!(finish_airport_id:5,
 start_date:'2018-09-20 11:00:00',start_hour:'', flight_duration:'03:10')

Airport.find(2).departing_flights.create!(finish_airport_id:1,
 start_date:'2018-09-21 17:00:00',start_hour:'', flight_duration:'05:00')

Airport.find(4).departing_flights.create!(finish_airport_id:5,
 start_date:'2018-09-20 17:00:00',start_hour:'', flight_duration:'01:00')

Airport.find(5).departing_flights.create!(finish_airport_id:3,
 start_date:'2018-09-21 19:00:00',start_hour:'', flight_duration:'3:10')

