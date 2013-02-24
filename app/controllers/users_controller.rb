class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def index
    	@users = User.find(:all, :order => "created_at ASC")
  	end

end
