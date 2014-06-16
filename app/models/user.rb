class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :username, :presence => true, :uniqueness => true
	validates :fullname, :presence => true

	acts_as_group_member
  	acts_as_named_group_member
  	acts_as_voter

  	mount_uploader :avatar, AvatarUploader
  	
	extend FriendlyId
	friendly_id :username, use: :slugged
	
end

class Concursante < User

	self.inheritance_column = :type

	#has_one :group, through: :group_membership

	extend FriendlyId
	friendly_id :username, use: :slugged

	

	acts_as_group_member
  	acts_as_named_group_member
end