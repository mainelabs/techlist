class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :page_title
      t.text :page_description
      t.string :results_one
      t.string :results_other
      t.string :slug
      t.string :q
      t.string :kind

      t.timestamps
    end
  end
end
