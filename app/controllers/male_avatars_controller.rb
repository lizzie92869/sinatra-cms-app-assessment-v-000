
class MaleAvatarsController < ApplicationController


# get "/male_avatars/new": display a form with pictures to click to create a smurf
get "/male_avatars/new" do
	erb :"male_avatars/new"
end

# post "/male_avatars": create the snurf avatar in the database and redirect to the smurf avatar page
post "/male_avatars" do
	@file_name="#{params[:eyes]}_#{params[:accessory]}.png"
	@eyes = params[:eyes]
	@accessory = params[:accessory]
	erb :"/male_avatars/new"	
end


end