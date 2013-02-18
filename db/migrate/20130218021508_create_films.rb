class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.datetime :date
      t.integer :status
      t.integer :position

      t.timestamps
    end
  end
end
