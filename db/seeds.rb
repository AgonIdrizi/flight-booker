
Airport.create!(airport_code: 'SVU')

def generate_code(number) #creates random 3 strings for airport-code
  charset = Array('A'..'Z') + Array('A'..'Z')
  Array.new(number) { charset.sample }.join
end


13.times do |n|
code = generate_code(3)
Airport.create!(airport_code: code)
end

Flight.create!(start_airport_id:1, finish_airport_id:6,
 start_date:'2018-09-18 14:00:00',start_hour:'', flight_duration:'01:30')

Flight.create!(start_airport_id:2, finish_airport_id:7,
 start_date:'2018-09-20 14:00:00',start_hour:'', flight_duration:'04:10')

Flight.create!(start_airport_id:3, finish_airport_id:7,
 start_date:'2018-09-19 10:00:00',start_hour:'', flight_duration:'05:10')

Flight.create!(start_airport_id:2, finish_airport_id:8,
 start_date:'2018-09-28 17:00:00',start_hour:'', flight_duration:'02:10')

Flight.create!(start_airport_id:8, finish_airport_id:3,
 start_date:'2018-09-25 17:00:00',start_hour:'', flight_duration:'03:10')

Flight.create!(start_airport_id:9, finish_airport_id:6,
 start_date:'2018-09-20 17:00:00',start_hour:'', flight_duration:'05:00')

Flight.create!(start_airport_id:4, finish_airport_id:5,
 start_date:'2018-09-20 17:00:00',start_hour:'', flight_duration:'01:00')

Flight.create!(start_airport_id:7, finish_airport_id:2,
 start_date:'2018-09-21 19:00:00',start_hour:'', flight_duration:'02:30')