class AddFieldsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :logo_url, :string
    add_column :places, :twitter_name, :string
  end
end
