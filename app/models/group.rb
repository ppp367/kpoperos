class Group < ActiveRecord::Base  
  acts_as_group :members => [:users, :assignments], :default_members => :users

  friendly_id :name, use: :slugged

end