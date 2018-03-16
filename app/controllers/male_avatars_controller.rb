
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

post "/save_avatar" do
	if logged_in?
		if @male_avatar = MaleAvatar.find_by(male_avatar_name: params[:male_avatar_name])
			@user = current_user
			@user.update_attribute(:male_avatar_id, @male_avatar.id)
			# binding.pry
			redirect to("/users/#{@user.id}")
		end
	else
		redirect to("/login")
	end
end


				# # get "/male_avatars/:id": display the smurf avatar page (options to edit, delete, user-profile, share)
				# get "/male_avatars/:id" do
				# 	erb :"/male_avatars/show"
				# end

				# # get "/male_avatars/:id/edit": display the current smurf avatar and the form to change it
				# get "/male_avatars/:id/edit" do
				# 	@male_avatar = MaleAvatar.find(params[:id])
				# 	erb :"/male_avatars/edit" 
				# end

				# # patch "/male_avatars/:id": update the smurf avatar
				# patch "/male_avatars/:id" do
				# 	@male_avatar = MaleAvatar.find(params[:id])
				# 	@male_avatar.update(params[:male_avatar])
				# 	redirect to("")
				# end
				# # delete "/male_avatars/:id/delete": delete the smurf avatar


end