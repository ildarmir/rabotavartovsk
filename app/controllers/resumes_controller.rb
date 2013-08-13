# coding: utf-8
class ResumesController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show, :search, :pic]
  # GET /resumes
  # GET /resumes.json
  def index
    @city=City.find_by_subdomain(request.subdomain)
    @resumes = @city.resumes.order("date desc").paginate(:page => params[:page], :per_page => 20, :order => "date desc") 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resumes }
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    @resume = Resume.find(params[:id])
    @resume[:view] = @resume[:view] + 1
    @resume.update_attributes(params[:view])
    @user=User.find_by_id(session[:user_id])
    respond_to do |format|
        format.html {render "show" }
        format.json { render json: @resume }
    end
  end
  
  def search
    @resumes = Resume.order('date desc').search(params[:search])    
    respond_to do |format|
   require 'will_paginate/array'
    @resumes = @resumes.paginate(:page => params[:page], :per_page => 20) 
      format.html # index.html.erb
      format.json { render json: @resume }
    end    
  end

  # GET /resumes/new
  # GET /resumes/new.json
  def new
    @resume = Resume.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /resumes/1/edit
  def edit
    @resume =@user.resumes.find(params[:id])
  end

  # POST /resumes
  # POST /resumes.json
  def create
  @user=User.find_by_id(session[:user_id])
    @resume = @user.resumes.new(params[:resume])
    @resume.city_id=City.find_by_id(params[:city_id])
    @resume.date = Time.now
    @resume.view = 0
    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Вы успешно создали резюме.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resumes/1
  # PUT /resumes/1.json
  def update
    @resume = @user.resumes.find(params[:id])
    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to @resume, notice: 'Резюме успешно обновлено' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume = @user.resumes.find(params[:id])
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end

  def pic
    require 'RMagick'
    phone=Magick::Draw.new
    img=Magick::Image.new(200,15)
    res=Resume.find_by_id(params[:id])
    img.annotate(phone, 0,0,0,0, "#{res.phone}"){
      self.font_family = 'Helvetica'
      self.fill = 'black'
      self.stroke = 'transparent'
      self.pointsize = 14
      self.gravity= Magick::SouthWestGravity
    }
    img.format='jpeg'
    send_data img.to_blob, :stream =>'false',:filename => 'phone.jpg',:type => 'image/jpeg', :disposition => 'inline'
  end
end
