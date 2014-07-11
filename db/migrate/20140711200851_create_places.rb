class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :kind
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :url
      t.text :description
      t.string :owner_name
      t.string :owner_email

      t.timestamps
    end
  end
end
