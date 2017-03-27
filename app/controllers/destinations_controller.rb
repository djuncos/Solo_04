class DestinationsController < ApplicationController


		def new
		    @destination = Destination.new
		end


		def show
		    @destination = Destination.find(params[:id])
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
