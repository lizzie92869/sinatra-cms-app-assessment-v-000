require './config/environment'

class ApplicationController < Sinatra::Base
  # register::ActiveRecordExtension

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

  get "/login" do
    if logged_in?
      erb :"/users/show"                                               # HELP
    else
    erb :"/login"
    end
  end

  post "/login" do
    @user = User.find_by(params[:user][:email])
    if @user && @user.authenticate(params[:user])
      erb :"/users/show"                                               # HELP
    else
     redirect to("/login")
     # flash[:message]="Sorry we couldn't find your account"           # HELP
    end
  end



# get "/login": display the form to sign in
# post "/login": check the password is the one associated with the email
# post "/logout": delete the session hash
# --------helper methods---------
  def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end


end




