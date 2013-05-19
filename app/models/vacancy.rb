class Vacancy < ActiveRecord::Base
belongs_to :user
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary, :view
  
  validates :position, :presence => true
  
  validates :phone, :presence => true
  
  def self.search(search)
    if search
    find(:all, :conditions => ['position like ?', "%#{search}%"], :order => 'created_at desc')
    else
    find(:all, :order =>'date desc')
    end
  end

end
