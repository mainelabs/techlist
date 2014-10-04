class RenameAddressInPlaces < ActiveRecord::Migration
  def change
    rename_column :places, :address, :street
  end
end
