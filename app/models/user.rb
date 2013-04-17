# coding: utf-8
class User < ActiveRecord::Base
has_many :resumes
has_many :vacancies
  attr_accessible :name, :password_digest, :password_digest_confirmation, :mail
  validates :name, presence: true, uniqueness: true
  validates :mail, presence: true, uniqueness: true, format: /@/
  validates :password_digest, presence: true, confirmation: true
#next strings for md5 encryption of password
  attr_accessor  :password_digest_confirmation
  before_create :hash_password
    def hash_password
        self[:password_digest] = Digest::MD5.hexdigest(self[:password_digest])
	  end

# has_secure_password
  after_destroy :ensure_an_admin_remains
  private
  def ensure_an_admin_remains
  if User.count.zero?
  raise "Последний пользователь не может быть удален"
  end
  end
end
