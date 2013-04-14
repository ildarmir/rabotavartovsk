class Vacancy < ActiveRecord::Base
belongs_to :users
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
