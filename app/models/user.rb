# coding: utf-8
class User < ActiveRecord::Base
has_many :resumes
has_many :vacancies
  attr_accessible :name, :password, :password_confirmation, :mail, :vacancies_added, :resumes_added, :article_added, :courses_added 
  validates :name, presence: true, uniqueness: true
  validates :mail, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains
  private
  def ensure_an_admin_remains
  if User.count.zero?
  raise "Последний пользователь не может быть удален"
  end
  end
end
