# coding: utf-8
class Forgot < ActionMailer::Base
  default from: "vartovskpeople@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.forgot.pass.subject
  #
  def pass(maile,random_password)
  @random_password=random_password 

    mail to: maile, subject: "Вам письмо"
  end
end
