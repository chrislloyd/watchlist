class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.datetime :date
      t.integer :position

      t.timestamps
    end
  end
end
