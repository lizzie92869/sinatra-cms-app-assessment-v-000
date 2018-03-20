require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
  	set :session_secret, "secret"
  end

  #display the index, asking to create a smurf or a smurfette
  get "/" do 
    pass_and_remove_messages
  	erb :index
  end 

# get "/login": display the form to sign in
  get "/login" do
    pass_and_remove_messages
    if logged_in?
      redirect to("/users/#{current_user.id}")                                               
    else
      erb :"/login"                                                      
    end
  end

# post "/login": check the password is the one associated with the email
  post "/login" do
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      session[:success_message] = "Successful connection to your account."
      redirect to("/users/#{@user.id}")                                               
    else
      session[:alert_message] = "Unsuccessful connection to your account."
     redirect to("/login")
    end
  end

# post "/save_avatar": save the corresponding avatar id (male ou female) in the row of male_avatar or female_avatar table
post "/save_avatar" do
  if logged_in?
    if @male_avatar = MaleAvatar.find_by(male_avatar_name: params[:male_avatar_name])
      @user = current_user
      @user.update_attribute(:male_avatar_id, @male_avatar.id)
      redirect to("/users/#{@user.id}")
    end
    if @female_avatar = FemaleAvatar.find_by(female_avatar_name: params[:female_avatar_name])
      @user = current_user
      @user.update_attribute(:female_avatar_id, @female_avatar.id)
      redirect to("/users/#{@user.id}")
    end
  else
    session[:alert_message] = "Sorry, you must be logged in to save your avatar."
    redirect to("/login")
  end
end


#post "/logout": delete the session hash
delete "/logout" do
  if logged_in?
        session.clear
        session[:success_message] = "Successful disconnection from your account."
    end
  redirect to("/")
end

# --------helper methods---------
private

  def logged_in?
      !!session[:user_id]
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end

  def redirect_wrong_user
    # @user = User.find(params[:id])
    if !logged_in? || !(current_user.id.to_s === params[:id])
    session[:alert_message] = "You must be logged in to see this page"
    redirect to("/")
    end
  end

  def pass_and_remove_messages
    @success_message = session[:success_message]
    session[:success_message] = nil
    @alert_message = session[:alert_message]
    session[:alert_message] = nil
  end

end




