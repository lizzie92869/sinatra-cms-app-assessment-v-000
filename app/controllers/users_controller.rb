class UsersController < ApplicationController

# get "/users/new": display signup form
get "/users/new" do
	@alert_message = session[:alert_message]
	session[:alert_message]=nil
	if logged_in?
		redirect to("/users/#{current_user.id}")  
	else
	erb :"/users/new"
	end
end

# post "/users": create the user in the database, create the session and redirect to user profile
post "/users" do
	@user = User.new(params[:user])
	if @user.save
		@session = session
		session[:user_id]=@user.id
		session[:success_message] = "You successfuy created your account"
		redirect to("/users/#{@user.id}")
	else 
		session[:alert_message] = "Error. Fill up the username and the password // Email must be unique"
		redirect to("/users/new")
		
	end
end

# get "/users/:id": display the user profile
get "/users/:id" do
	@user = User.find(params[:id])
	redirect_wrong_user
		if @user.male_avatar
			@file_name = @user.male_avatar.male_avatar_name
		end
		if @user.female_avatar
			@file_name = @user.female_avatar.female_avatar_name
		end
		pass_and_remove_messages
		erb :"/users/show"
end

# get "/users/:id/edit": display the form to change the user informations
get "/users/:id/edit" do
	@user = User.find(params[:id])
	redirect_wrong_user
	erb :"/users/edit"
end

# post "/users/:id": update the user information
patch "/users/:id" do
	redirect_wrong_user
	@user = User.find(params[:id])
		if @user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
			session[:success_message]="Your account has been successfuy updated"
			redirect to("/users/#{@user.id}")
		else
			session[:alert_message] = "Account couldn't be updated, make sure to fill up the username and the password"
			redirect to("/users/#{@user.id}")
		end
end

#delete "/users/:id/delete": delete the user
delete "/users/:id/delete" do
	redirect_wrong_user
	@user = User.find(params[:id])
	@user.destroy
	redirect to("/")
end

end

