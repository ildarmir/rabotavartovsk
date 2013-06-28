class MainpageController < ApplicationController
  skip_before_filter :authorize
 def index
    @vac = Vacancy.limit(5).order("created_at DESC")
    pop = Vacancy.select("id,position,view").order("created_at desc").limit(25)
    pop=pop.each {|k| k.view=0 if k.view.nil? }
    pop.sort_by! {|k| k.view}
    @pop=pop.reverse.slice(0..4)
    @res = Resume.limit(5).order("id DESC")    
 end
  
end
