
class MaleAvatarsController < ApplicationController


# get "/male_avatars/new": display a form with pictures to click to create a smurf

get "/male_avatars/new" do
	erb :"male_avatars/new"
end

post "/male_avatars" do
	@file_name="#{params[:eyes]}_#{params[:accessory]}.png"
	@eyes = params[:eyes]
	@accessory = params[:accessory]
	erb :"/male_avatars/new"	
end

post "/save_avatar" do
	
	@male_avatar = MaleAvatar.create(params)
	user = User.first
	user.male_avatar = @male_avatar
	user.save
	redirect to("/users/#{user.id}")
	
end


# af = AvitarMale.find(params[:id])
# file_name = "#{af.hair}_#{af.hat_sytle}_#{af.eye_color}.jpg"

# <img src="<%= file_name %>">





# post "/male_avatars": create the snurf avatar in the database and redirect to the smurf avatar page
# get "/male_avatars/:id": display the smurf avatar page (options to edit, delete, user-profile, share)
# get "/male_avatars/:id/edit": display the current smurf avatar and the form to change it
# patch "/male_avatars/:id": update the smurf avatar
# delete "/male_avatars/:id/delete": delete the smurf avatar


end