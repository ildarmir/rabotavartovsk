class LangepasController < ApplicationController
  skip_before_filter :authorize
 def index
   @city=City.find_by_subdomain(request.subdomain)
    @vac = @city.vacancies.limit(8).order("created_at DESC")
    pop = @city.vacancies.select("id,position,view").order("created_at desc").limit(30)
    pop=pop.each {|k| k.view=0 if k.view.nil? }
    pop.sort_by! {|k| k.view}
    @pop=pop.reverse.slice(0..7)
    @res = @city.resumes.limit(7).order("id DESC")    
    @best = @city.resumes.where("avatar is not null and education!='' and skills!=''  and about!='' and email!='' and phone!=''").limit(2).order("id DESC")
 end
end
