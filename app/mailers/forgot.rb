# coding: utf-8
class Forgot < ActionMailer::Base
  default from: "vartovskpeople@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.forgot.pass.subject
  #
  def pass(var1,var2)
  @random_password=var2 

    mail to: var1, subject: "Восстановление учетной записи" do |format|
    format.text {render :text=> "Вы запросили восстановление учетной записи. Ваш новый пароль #{@random_password}"}
    end
  end
end
