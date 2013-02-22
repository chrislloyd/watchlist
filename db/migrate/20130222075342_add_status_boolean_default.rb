class AddStatusBooleanDefault < ActiveRecord::Migration
  def change
  	change_column :films, :status, :boolean, :default => false
  end
end
