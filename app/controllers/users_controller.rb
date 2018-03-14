class UsersController < ApplicationController
# get "/users/new": display signup form

get "/users/new" do
	erb :"/users/new"
end

# post "/users": create the user in the database and redirect to user profile
post "/users" do
	@user = User.create(params[:user])
	redirect to("/users/#{@user.id}/show")
end

get "/users/:id" do
	@file_name = User.find(params[:id]).male_avatar.male_avatar_name
	erb :"/users/show"
end

# get "/users/:id": display the user profile
# get "/users/:id/edit": display the form to change the user informations
# post "/users/:id": update the user information
# delete "/users/:id/delete": delete the user
end