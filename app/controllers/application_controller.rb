# coding: utf-8
class ApplicationController < ActionController::Base
        layout "mainpage"
 	before_filter :set_locale
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end
        before_filter :authorize
        protected
        def authorize
          unless User.find_by_id(session[:user_id])
          redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
        end
        end


	def default_url_options(options={})
	  logger.debug "default_url_options is passed options: #{options.inspect}\n"
	  { :locale => I18n.locale }
	end

  protect_from_forgery
end
