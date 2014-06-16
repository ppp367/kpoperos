class Group < ActiveRecord::Base  
  acts_as_group :members => [:users], :default_members => :users
  acts_as_votable
  validates :name, :presence => true, uniqueness: true

  mount_uploader :avatar, AvatarUploader
  

  #has_many: :users, through: :group_membership

  extend FriendlyId
  friendly_id :name, use: :slugged
end