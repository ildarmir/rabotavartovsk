class DeviseUser < ActiveRecord::Base
require 'typus/orm/active_record/user/instance_methods'
require 'typus/orm/active_record/user/instance_methods_more'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  include Typus::Orm::ActiveRecord::User::InstanceMethods
  include Typus::Orm::ActiveRecord::User::InstanceMethodsMore
  # 
end