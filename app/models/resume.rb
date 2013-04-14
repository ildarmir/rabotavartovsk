class Resume < ActiveRecord::Base
belongs_to :user
  
  attr_accessible :about, :age, :avatar, :city, :date, :education, :email, :experience, :group_id,  :mar_status, :min_wage, :name, :phone, :position, :schedule, :sex, :skills, :view
  
  mount_uploader :avatar, AvatarUploader
validates_uniqueness_of :login  
validates :phone, :presence => true
validates :position, :presence => true
  def self.search(search)
    if search
      find(:all, :conditions => ['position LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

                               
end
