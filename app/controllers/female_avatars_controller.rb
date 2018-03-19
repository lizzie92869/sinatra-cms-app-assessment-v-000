class FemaleAvatarsController < ApplicationController


# get "/female_avatars/new": display a form with pictures to click to create a smurfette
get "/female_avatars/new" do
	erb :"female_avatars/new"
end

# post "/female_avatars": create the snurfette avatar in the database and redirect to the smurfette avatar page
post "/female_avatars" do
	@file_name="#{params[:eyes]}_#{params[:hair]}.png"
	@eyes = params[:eyes]
	@hair = params[:hair]
	erb :"/female_avatars/new"	
end

post "/save_avatar" do
	if logged_in?
		if @female_avatar = FemaleAvatar.find_by(female_avatar_name: params[:female_avatar_name])
			@user = current_user
			@user.update_attribute(:female_avatar_id, @female_avatar.id)
			redirect to("/users/#{@user.id}")
		end
	else
		redirect to("/login")
	end
end


end