class ChangeStatusToBoolean < ActiveRecord::Migration
  def change
  	change_column :films, :status, :boolean
  end
end
