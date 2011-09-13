class Group < ActiveRecord::Base
  has_many :groupings
  has_many :users, :through => :groupings
  has_many :articles

  acts_as_taggable
end
