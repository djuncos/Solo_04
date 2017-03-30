class SpacesController < ApplicationController


	def show
		 @space = Space.find(params[:id])
		 @destination = current_user.destinations.last 
		    
	end

	def edit
		@space = Space.find(params[:id])
  	end

  	def different



  	end

	def create
		@space = current_user.spaces.new(space_params)
	    @location = Geocoder.search(@space.latitude,@space.longitude)
	    @space.address = @location[0].address
	    @space.status = 0
	    @space.claimed = false
	    if @space.save
		  flash[:notice] = "Space was successfully created."
		  redirect_to root
	    else
	      redirect_to :back
	    end
	end


  	def put
  		@space_pre = Space.find(params[:space_id])
  		@space = @space_pre.update(:claimed=>true)
  		@space_pre.save
  		redirect_to @space_pre
  	end
  		

	def update
	    @space = Space.find(params[:id])
	    if @space.update_attributes(space_params)
	      flash[:notice] = "Space was successfully updated."
	      redirect_to @space
	    else
	      render 'edit'
	    end
  	end

  	def destroy
		    Space.find(params[:id]).destroy
		    flash[:notice] = "Space was successfully deleted."
		    redirect_to root
	end

	def transfer

			# @space_out = Space.find(params[:id])
			# @space_lat = @space_out.latitude
			# @space_long = @space_out.longitude
			# @space_out.destroy

		 #    @space_in = Space.create(user_id: current_user.id)
		 #    @space_in.latitude = @space_lat
		 #    @space_in.longitude = @space_long

		 @space = Space.find(params[:id])
		 @space.update(:user_id => current_user.id, :status => 0, :claimed => false)
		 flash[:notice] = "Space was successfully transferred."
		 redirect_to root_url

	end



	private

	def space_params
	      params.require(:space).permit(:latitude, :longitude, :status)
	end

	def destination_params
	      params.require(:destination).permit(:id, :address, :user_act_latitude, :user_act_longitude)
	end	


end
