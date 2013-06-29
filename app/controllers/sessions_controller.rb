# coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
    Session.sweep
  end

  def create
    
    if params[:name] && params[:name].include?("@")
      user=User.find_by_mail(params[:name])
    elsif params[:name]
      user = User.find_by_name(params[:name])
    end

    if user[:old_pass] and !user[:password]
      params_pass = Digest::MD5.hexdigest(params[:password]).reverse + "b3p6f"
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
  def newpass
  end
  # assign them a random one and mail it to them, asking them to change it

  def forgot_password
    if params[:mail]!=nil
      @user = User.find_by_mail(params[:mail])
    elsif params[:name]!=nil
      @user=User.find_by_name(params[:name])
    end
    if @user && @user.mail!=nil
      chars = ('a'..'z').to_a + ('1'..'9').to_a - ['o', 'O', 'i', 'I']  	    
      random_password = Array.new(7) { chars[rand(chars.size)] }.join
      @user.password = random_password
      @user.save!
      Forgot.pass(@user.mail,random_password).deliver
    end
    respond_to do |format|
      if @user
        format.html { redirect_to  login_url, notice: "Проверьте почтовый ящик" }
        format.json { render json: @user, status: :created, location: @user }
      elsif @user.nil?
        format.html { render action: "new", notice: "Почтовый ящик не зарегистрирован" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
