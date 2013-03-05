class MainpageController < ApplicationController
  skip_before_filter :authorize
 def index
    @vac = Vacancy.limit(5).order("id DESC")
    @res = Resume.limit(5).order("id DESC")    
  end
  
end
