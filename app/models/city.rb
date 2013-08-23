class City < ActiveRecord::Base
  has_many :resumes
  has_many :vacancies
  attr_accessible :subdomain, :name, :title, :sidebar, :addresume, :addvacancy, :footer
  attr_accessible :id, :created_at, :updated_at,:subdomain, :name, :title, :sidebar, :footer, :addresume, :addvacancy, :as=> :admin
end
