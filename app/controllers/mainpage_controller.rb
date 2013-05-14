class MainpageController < ApplicationController
  skip_before_filter :authorize
 def index
    @vac = Vacancy.limit(5).order("id DESC")
    @pop = Vacancy.limit(5).offset(5).order("id DESC").reverse_order
    @res = Resume.limit(5).order("id DESC")    
 end
  
end
