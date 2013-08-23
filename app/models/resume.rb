class Resume < ActiveRecord::Base
belongs_to :user
belongs_to :city
  
  attr_accessible :about, :age, :avatar, :city, :date, :education, :email, :experience, :group_id,  :mar_status, :min_wage, :name, :phone, :position, :schedule, :sex, :skills, :view, :city_id 
  attr_accessible :about, :age, :avatar, :city, :date, :education, :email, :experience, :group_id,  :mar_status, :min_wage, :name, :phone, :position, :schedule, :sex, :skills, :view, :city_id, :as=>:admin
  
  mount_uploader :avatar, AvatarUploader
validates :phone, :presence => true
validates :position, :presence => true
  def self.search(search)
    if search
      find(:all, :conditions => ['position LIKE ?', "%#{search}%"], :order =>"created_at desc")
    else
      find(:all, :order => "created_at desc")
    end
  end
 def previous_post
    self.class.first(:conditions => ["id < ? and city_id=?",id,city_id], :order => "id desc,position")
  end

  def next_post
    self.class.first(:conditions => ["id > ? and city_id=?", id, city_id], :order => "id asc,position")
  end


                               
end
