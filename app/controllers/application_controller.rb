# coding: utf-8
class ApplicationController < ActionController::Base
  layout "mainpage"
  protect_from_forgery
  before_filter :set_locale, :get_article
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def get_article
    idarr=Article.select("id").map {|k| k.id}
    id=idarr[rand(idarr.size)]
    @side_article=Article.find(id) if id
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
      { :locale => I18n.locale }
  end
  before_filter :authorize 
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
    else
      @user=User.find_by_id(session[:user_id])
    end
  end
end
