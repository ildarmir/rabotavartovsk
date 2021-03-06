# coding: utf-8
class VacanciesController < ApplicationController
  skip_before_filter :authorize, only: [:search, :show, :index]
  # GET /vacancies
  # GET /vacancies.json
  
  def index
    @vacancies = @city.vacancies.paginate page: params[:page], order: 'created_at desc', per_page: 500
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacancies }
    end
  end
  
  def search 
    @vacancies = @city.vacancies.search(params[:search])
    respond_to do |format|
    require 'will_paginate/array'
    @vacancies = @vacancies.paginate(:page => params[:page], :per_page => 500) 
      format.html # index.html.erb
      format.json { render json: @vacancies }
    end
    
  end

  # GET /vacancies/1
  # GET /vacancies/1.json
  def show
    @vacancy = Vacancy.find(params[:id])
    if !cookies[:_time] then cookies[:_time]="" end
    if !(cookies[:_time].include? request.url.crypt('.1'))
      Vacancy.update_counters [@vacancy.id], :view => 1
    end
    cookies[:_time]=request.url.crypt('.1')+ cookies[:_time].slice!(0..150)
    @user=User.find_by_id(session[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacancy }
    end
  end
  
 

  # GET /vacancies/new
  # GET /vacancies/new.json
  def new
    @vacancy = Vacancy.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacancy }
    end
  end

  # GET /vacancies/1/edit
  def edit
    @vacancy = @user.vacancies.find(params[:id])
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = @user.vacancies.new(params[:vacancy])
    if !params[:city_id].nil? && !params[:city_id].empty? && params[:city_id].size==1
      @vacancy.city=City.find_by_id(params[:city_id])
    elsif request.subdomain!='' 
      @vacancy.city_id=City.find_by_subdomain(request.subdomain) 
    else
      @vacancy.city_id=City.find_by_subdomain("vartovsk")
    end
    @vacancy[:date] = Time.now
    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to @vacancy, notice: 'Вы успешно создали вакансию.' }
        format.json { render json: @vacancy, status: :created, location: @vacancy }
      else
        format.html { render action: "new" }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /vacancies/1
  # PUT /vacancies/1.json
  def update
    @vacancy = @user.vacancies.find(params[:id])
    respond_to do |format|
      if @vacancy.update_attributes(params[:vacancy])
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.json
  def destroy
    @vacancy = @user.vacancies.find(params[:id])
    @vacancy.destroy

    respond_to do |format|
      format.html { redirect_to vacancies_url }
      format.json { head :no_content }
    end
  end
end
