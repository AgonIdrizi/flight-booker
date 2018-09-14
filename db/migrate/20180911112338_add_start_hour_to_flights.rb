class AddStartHourToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :start_hour, :string
  end
end
