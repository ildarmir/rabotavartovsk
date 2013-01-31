class Vacancy < ActiveRecord::Base
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary
  
  validates :position, :presence => true
  
  validates :phone, :presence => true
  
  def self.search(search)
    if search
      find(:all, :conditions => ['position LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
