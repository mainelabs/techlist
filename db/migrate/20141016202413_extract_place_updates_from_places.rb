class ExtractPlaceUpdatesFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :type, :string
    remove_column :places, :place_id, :integer

    create_table :place_updates do |t|
      t.references  :place
      t.string   :state
      t.string   :name
      t.string   :kind
      t.string   :street
      t.string   :zip_code
      t.string   :city
      t.string   :url
      t.text     :description
      t.string   :owner_name
      t.string   :owner_email
      t.string   :logo_url
      t.string   :twitter_name

      t.timestamps
    end
  end
end
