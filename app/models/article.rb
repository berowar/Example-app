class Article < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  belongs_to :group

  validates :author_id, :group_id, :title, :body, :presence => true
end
