class RemoveExcessTables < ActiveRecord::Migration
  def change
  	drop_table :restaurants
  	drop_table :places
  end
end
