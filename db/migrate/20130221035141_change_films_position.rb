class ChangeFilmsPosition < ActiveRecord::Migration
  def change
  	change_column :films, :position, :integer, :default => 50000
  end
end
