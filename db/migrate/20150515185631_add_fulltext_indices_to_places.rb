class AddFulltextIndicesToPlaces < ActiveRecord::Migration
  def change
    add_index :places, :name
    add_index :places, :description
    add_index :places, :street
    add_index :places, :city
    add_index :places, :zip_code
    add_index :places, :url
    add_index :places, :twitter_name
  end
end
