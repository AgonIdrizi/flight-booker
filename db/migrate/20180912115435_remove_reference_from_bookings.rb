class RemoveReferenceFromBookings < ActiveRecord::Migration[5.2]
  def change
  	remove_reference(:bookings, :passenger, index:true, foreign_key:true)
  end
end
