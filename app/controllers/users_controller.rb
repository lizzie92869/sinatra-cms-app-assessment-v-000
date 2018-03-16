class UsersController < ApplicationController
# register Sinatra::Flash

# get "/users/new": display signup form
get "/users/new" do
	if logged_in?
		erb :"/users/show"
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
		redirect to("/users/#{@user.id}")
	else 
		redirect to("/users/new")
		# flash[:message]="We couldn't create your account"
	end
end

# get "/users/:id": display the user profile
get "/users/:id" do
	@user = User.find(params[:id])
	if @user.male_avatar
		@file_name = @user.male_avatar.male_avatar_name
	end
	erb :"/users/show"
end

# get "/users/:id/edit": display the form to change the user informations
get "/users/:id/edit" do
	@user = User.find(params[:id])
	erb :"/users/edit"
end

# post "/users/:id": update the user information
patch "/users/:id" do
	@user = User.find(params[:id])
	@user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
	binding.pry
	redirect to("/users/#{@user.id}")
end

#delete "/users/:id/delete": delete the user
delete "/users/:id/delete" do
  if logged_in?
        session.clear
    end
  redirect to("/")
end
end


