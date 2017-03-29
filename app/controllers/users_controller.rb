class UsersController < ApplicationController


	def index
		@user = current_user
		@space = @user.space
		@destination = Destination.new

		# for viewing purposes

		
		@spaces = Space.all


	end



end
