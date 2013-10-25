class Vacancy < ActiveRecord::Base
belongs_to :user
belongs_to :city

  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary, :view, :city, :as=>:admin
  attr_accessible :date, :email, :experience, :note, :organisation, :phone, :position, :salary, :view, :city_id
  
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
    self.class.first(:conditions => ["id < ? and city_id =?",id, city_id], :order => "id desc,position")
  end

  def next_post
    self.class.first(:conditions => ["id > ? and city_id=?", id,city_id], :order => "id asc,position")
  end

end
