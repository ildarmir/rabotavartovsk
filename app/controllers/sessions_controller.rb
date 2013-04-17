# coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

def create
 require 'digest'
 user = User.find_by_name(params[:name])
 params_pass = Digest::MD5.hexdigest(params[:password])    
 if user and user[:password] == params_pass
 #if user and user.authenticate(params[:password])
 session[:user_id] = user.id
 redirect_to mainpage_url
 else
 redirect_to login_url, alert: "Неверная комбинация имени и пароля"
 end
end

  def destroy
  session[:user_id] = nil
  redirect_to mainpage_url, notice: "Сеанс работы завершен"
  end
end
