class Vacancy < ActiveRecord::Base
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary
  
  validates :position, :presence => true
  
  validates :phone, :presence => true
end
