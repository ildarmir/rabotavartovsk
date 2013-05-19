class MainpageController < ApplicationController
  skip_before_filter :authorize
 def index
    @vac = Vacancy.limit(5).order("id DESC")
    pop = Vacancy.select("id,position,view").order("id desc").limit(20)
    @pop=pop.reorder("view desc").limit(5)
    @res = Resume.limit(5).order("id DESC")    
 end
  
end
