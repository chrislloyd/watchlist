class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :title
      t.datetime :date
      t.integer :review
      t.integer :position

      t.timestamps
    end
  end
end
