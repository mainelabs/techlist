class AddCoordinatesFieldsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :lat, :float
    add_column :places, :lon, :float
  end
end
