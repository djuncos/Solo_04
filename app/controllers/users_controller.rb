class UsersController < ApplicationController

	require "delayed_job_active_record"
	before_action :my_redirect, except: [:walking_update, :arrived_update]


	def walking_update

		@spaces = Space.all
		

		@user = current_user
		@space = @user.space
		@space.update(:status=>1)

		@space.save
		redirect_to walking_path



	end

	def walking
		
	end

	def arrived_update

		@user = current_user
		@space = @user.space
		@space.update(:status=>2)

		@space.save
		flash[:notice] = "You have arrived at your space.  Have a nice day!."

		@space.delay(run_at: 0.1.minute.from_now).destroy

		redirect_to arrived_path



	end
  	

	def arrived

	end



	def index
		@user = current_user
		@space = @user.space
		@destination = Destination.new

		# for viewing purposes

		
		@spaces = Space.all

	end



	private

	def my_redirect
		@spaces = Space.all
		@user = current_user
		@space = @user.space

	    if @space != nil

	      	if @space.status==0
	      
	      		render :parked

	      	elsif @space.status==1

	      		render "walking"
	      	end

	    end

	end	

end
