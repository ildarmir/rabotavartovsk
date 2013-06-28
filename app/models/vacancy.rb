class Vacancy < ActiveRecord::Base
belongs_to :user
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary, :view, :as=>:admin
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary, :view
  
  validates :position, :presence => true
  
  validates :phone, :presence => true
  
  def self.search(search)
    if search
    find(:all, :conditions => ['position like ?', "%#{search}%"], :order => 'updated_at desc')
    else
    find(:all, :order =>'updated_at desc')
    end
  end

  def previous_post
    self.class.first(:conditions => ["id < ?",id], :order => "id desc,position")
  end

  def next_post
    self.class.first(:conditions => ["id > ?", id], :order => "id asc,position")
  end
end
