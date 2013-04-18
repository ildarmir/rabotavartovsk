# coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

def create
 user = User.find_by_name(params[:name])
 if user[:old_pass] and !user[:password]
 params_pass = Digest::MD5.hexdigest(params[:password])    
	 if user and user[:old_pass] == params_pass
	 user[:password_digest] = BCrypt::Password.create(params[:password])
	 user[:old_pass] = nil
	 user.update_attribute(:password_digest, user[:password_digest])
	 user.update_attribute(:old_pass, user[:old_pass])
	 session[:user_id] = user.id
	 redirect_to mainpage_url
	 else
	 redirect_to login_url, alert: "Неверная комбинация имени и пароля"
	 end
 elsif user.authenticate(params[:password])
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
