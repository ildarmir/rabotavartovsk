class MainpageController < ApplicationController
  skip_before_filter :authorize
 def index
    @vac = Vacancy.limit(5).order("id DESC")
    pop = Vacancy.select("position,view").order("id desc").limit(5).scoped
    @pop=pop.reorder("view desc")
    @res = Resume.limit(5).order("id DESC")    
 end
  
end
