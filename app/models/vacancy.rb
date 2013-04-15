class Vacancy < ActiveRecord::Base
belongs_to :user
self.per_page = 20
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary
  
  validates :position, :presence => true
  
  validates :phone, :presence => true
  
  def self.search(search)
    if search
    find(:all, :conditions => ['position like ?', "%#{search}%"], :order => 'created_at', per_page => 20)
    else
    find(:all)
    end
  end

end
