# coding: utf-8
class CallController < ApplicationController
  def index
    
  end
  def sendmail
    if mess=params[:message]
      man=User.find_by_id(session[:user_id]).id
      Forgot.cllback(mess,man).deliver
    end
    respond_to do |format|
      format.html {redirect_to "/",notice: "Спасибо, Ваше сообщение отправлено"}
    end

  end
end
