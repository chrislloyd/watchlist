class ConvertStatusToBoolean < ActiveRecord::Migration
  def self.up
    add_column :films, :convert_status, :boolean, :default => false
    
    # look up the schema's to be able to re-inspect the Project model
    # http://apidock.com/rails/ActiveRecord/Base/reset_column_information/class
    Film.reset_column_information
    
    # loop over the collection
    Film.all.each do |f|
        f.convert_status = f.status == '0'
        f.save
    end
    
    # remove the older status column
    remove_column :films, :status
    # rename the convert_status to status column
    rename_column :films,:convert_status,:status
  end

  def self.down
    change_column :films, :status, :boolean
  end
end