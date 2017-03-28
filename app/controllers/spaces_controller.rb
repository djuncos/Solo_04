class SpacesController < ApplicationController


	def show
		 @space = Space.find(params[:id])
		    
	end

	def edit
		@space = Space.find(params[:id])
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

	private

	def space_params
	      params.require(:space).permit(:latitude, :longitude, :status)
	end	


end
