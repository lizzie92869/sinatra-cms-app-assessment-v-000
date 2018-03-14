require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
  	set :session_secret, "secret"
  end


  #display the index, asking to create a smurf or a smurfette
  get "/" do 
  	erb :index
  end 

  get "/avatars" do
    @avatars = []
    @avatars << MaleAvatar.all 
    @avatars << FemaleAvatar.all
    erb :"avatars"
  end


# get "/signin": display the form to sign in
# post "/signin": check the password is the one associated with the email
# post "/logout": delete the session hash


end