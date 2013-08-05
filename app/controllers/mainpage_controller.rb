class MainpageController < ApplicationController
  skip_before_filter :authorize
 def index
    @vac = Vacancy.limit(8).order("created_at DESC")
    pop = Vacancy.select("id,position,view").order("created_at desc").limit(30)
    pop=pop.each {|k| k.view=0 if k.view.nil? }
    pop.sort_by! {|k| k.view}
    @pop=pop.reverse.slice(0..7)
    @res = Resume.limit(7).order("id DESC")    
    @best = Resume.where("avatar is not null and education!='' and skills!=''  and about!='' and email!='' and phone!=''").limit(2).order("id DESC")
 end

 def city_change
   if params[:city]=="vartovsk"
     redirect_to  controller: :mainpage, action: :index, subdomain: false
   end
   if params[:city]=="langepas"
     redirect_to  controller: :langepas, action: :index, subdomain: :langepas
   end
   if params[:city]=="megion"
     redirect_to  controller: :megion, action: :index, subdomain: :megion
   end
   if params[:city]=="raduzhnyi"
     redirect_to  controller: :raduzhnyi, action: :index, subdomain: :raduzhnyi
   end
   if params[:city]=="pokachi"
     redirect_to  controller: :pokachi, action: :index, subdomain: :pokachi
   end

 end
  
end
