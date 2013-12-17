#coding: utf-8
require 'test_helper'

class VacancyTest < ActiveSupport::TestCase
  fixtures :vacancies
   test "position_presence" do
     assert vacancies(:one).valid?, "vacancy one invalid"
     assert vacancies(:two).valid?, "vacancy two invalid"
     assert vacancies(:no_name_vacancy).invalid?, "vacancy no_name_vacancy valid!"
   end
end
