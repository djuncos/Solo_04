	class DestinationsController < ApplicationController


		def new
		    @destination = Destination.new
		end


		def show
			@user = current_user
			@destination = @user.destinations.last
			  # @destination = Destination.find(params[:id])
		    @spaces_unclaimed = Space.where(:claimed => false)
		    @spaces_green = @spaces_unclaimed.where(:status => 2)
		    @spaces_yellow = @spaces_unclaimed.where(:status => 1)
		end

		def create
		    @destination = current_user.destinations.new(destination_params)
		    @location = Geocoder.search(@destination.address)
		    @destination.latitude = @location[0].latitude
		    @destination.longitude = @location[0].longitude
		    if @destination.save
			  flash[:notice] = "Destination was successfully created."
			  redirect_to @destination
		    else
		      redirect_to :back
		    end
		end

		def update
		    @destination = Destination.find(params[:id])
		    if @destination.update_attributes(destination_params)
		      flash[:notice] = "Destination was successfully updated."
		      redirect_to @destination
		    else
		      render 'edit'
		    end
	  	end



		def destroy
		    Destination.find(params[:id]).destroy
		    flash[:notice] = "Destination was successfully deleted."
		    redirect_to root_url
		end

		

		private

	    def destination_params
	      params.require(:destination).permit(:address, :user_act_latitude, :user_act_longitude)
	    end



end
