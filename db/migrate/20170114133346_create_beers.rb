class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :brewery_id
      add_column :beers, :style_id, :integer
      t.timestamps null: false
    end
  end
end
