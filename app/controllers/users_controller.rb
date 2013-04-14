#coding: utf-8
class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  before_filter :atom
  # GET /users
  # GET /users.json
#  def index
#    @users = User.order(:name)
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @users }
#    end
#  end

  # GET /users/1
  # GET /users/1.json
#  def show
#    @user = User.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @user }
#    end
#  end

  # GET /users/new
  # GET /users/new.json
  def new
    if !@user
    @user = User.new
    else
	    redirect_to logout_url, notice: "Вы авторизованы"
	    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if !@user
    @user = User.new(params[:user])
    else
	    redirect_to mainpage_url, notice: "Вы авторизованы"
	    end
    if !@user[:password].nil?
      @user[:password] = Digest::MD5.hexdigest(params[:name][:password])
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to  login_url, notice: "Пользователь #{@user.name} был успешно создан " }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
    @user.destroy
    flash[:notice] = "Пользователь #{@user.name} удален"
    rescue Exception => e
    flash[:notice] = e.message
 end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  private
  def atom
unless @user==User.find_by_id(session[:user_id])
	redirect_to logout_url, notice: "Ошибка"
	end
	end

end
