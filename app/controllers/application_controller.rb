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

# get "/login": display the form to sign in
  get "/login" do
    if logged_in?
      erb :"/users/show"                                               # HELP :id for the user
    else
      erb :"/login"                                                      # prefill the field, need a @user?
    end
  end

# post "/login": check the password is the one associated with the email
  post "/login" do
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect to("/users/#{@user.id}")                                               # HELP
    else
     redirect to("/login")
     # flash[:message]="Sorry we couldn't find your account"           # HELP
    end
  end


#post "/logout": delete the session hash


# --------helper methods---------

  def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end


end




