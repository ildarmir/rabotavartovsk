class Course < ActiveRecord::Base
  attr_accessible :date, :date_end, :description, :format, :place, :price, :title
end
