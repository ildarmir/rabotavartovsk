class IndexController < ApplicationController
  def index
    @vac = Vacancy.limit(5).order("id DESC")
    @res = Resume.limit(5).order("id DESC")
    flash[:notice] = t(:hello_flash)
  end

end
