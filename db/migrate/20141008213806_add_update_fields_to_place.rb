class AddUpdateFieldsToPlace < ActiveRecord::Migration
  def change
    add_column :places, :type, :string, index: true
    add_column :places, :place_id, :integer, index: true
  end
end
