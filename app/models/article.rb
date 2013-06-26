class Article < ActiveRecord::Base
  attr_accessible :add_time, :author, :des, :mini_img, :text, :title, :view, :as=>:admin
  attr_accessible :add_time, :author, :des, :mini_img, :text, :title, :view
  mount_uploader :mini_img, ArticleImageUploader
end
