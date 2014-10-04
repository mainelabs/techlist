class RenameLatAndLonToLatitudeAndLongitude < ActiveRecord::Migration
  def change
    rename_column :places, :lat, :latitude
    rename_column :places, :lon, :longitude
  end
end
