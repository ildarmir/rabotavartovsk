class City < ActiveRecord::Base
  has_many :resume
  has_many :vacancy
  attr_accessible :subdomain, :name
end
