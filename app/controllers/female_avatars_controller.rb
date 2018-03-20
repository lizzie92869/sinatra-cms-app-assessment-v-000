class FemaleAvatarsController < ApplicationController


# get "/female_avatars/new": display a form with pictures to click to create a smurfette
get "/female_avatars/new" do
	erb :"female_avatars/new"
end

# post "/female_avatars": get the file name of the snurfette avatar in the database and redirect to the same page until the user call post "/save_avatar"
post "/female_avatars" do
	@file_name="#{params[:eyes]}_#{params[:hair]}.png"
	@eyes = params[:eyes]
	@hair = params[:hair]
	erb :"/female_avatars/new"	
end


end