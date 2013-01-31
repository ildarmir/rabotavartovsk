class SessionController < ApplicationController
  def new
  end

  def create    
    user = Resume.find_by_login(params[:login])
    #user_pass = Digest::MD5.hexdigest(user[:password])    
    params_pass = Digest::MD5.hexdigest(params[:password])    
    if user and user[:password] == params_pass
      session[:user_id] = user[:id]
      session[:login] = user.login
      session[:avatar] = user.avatar
      session[:group_id] = user.group_id
      redirect_to :controller => :index, :action => :index
    else
      redirect_to :back, :flash => { :error => "Login or password are incorrect" }
      #redirect_to :controller => "index", :action => "index", notice: 'Resume was successfully created.'
      #redirect_to :controller => :index, :action => :index, alert: "Invalid user/password combination"    
    end
  end

  def destroy
    session[:user_id] = nil
    session[:login] = nil
    session[:avatar] = nil
    session[:group_id] = nil
    redirect_to :controller => :index, :action => :index
  end
end
