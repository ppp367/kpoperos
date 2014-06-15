class Group < ActiveRecord::Base  
  acts_as_group :members => [:users], :default_members => :users
  acts_as_votable
  acts_as_commentable
  validates :name, :presence => true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end