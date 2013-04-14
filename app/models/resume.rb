class Resume < ActiveRecord::Base
belongs_to :users
  
  attr_accessible :about, :age, :avatar, :city, :date, :education, :email, :experience, :group_id,  :mar_status, :min_wage, :name, :phone, :position, :schedule, :sex, :skills, :view
  
  mount_uploader :avatar, AvatarUploader
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
