class Group < ActiveRecord::Base
  has_many :groupings
  has_many :users, :through => :groupings
  acts_as_taggable
end
