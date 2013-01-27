class IndexController < ApplicationController
  def index
    @vac = Vacancy.limit(5).order(:id)
    @res = Resume.limit(5).order(:id)
  end
end
