class Resume < ActiveRecord::Base
  
  attr_accessible :about, :age, :avatar, :city, :date, :education, :email, :experience, :group_id, :login, :mar_status, :min_wage, :name, :password, :phone, :position, :schedule, :sex, :skills, :view
  
validates_uniqueness_of :login  

validates :login, :presence => true  

validates :phone, :presence => true

validates :position, :presence => true
  
validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 1..40},
                       :on => :create
                       
validates :password, :confirmation => true,
                       :length => {:within => 1..40},
                       :allow_blank => true,
                       :on => :update

  def self.search(search)
    if search
      find(:all, :conditions => ['position LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

                               
end
