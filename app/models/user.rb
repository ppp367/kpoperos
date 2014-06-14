class User < ActiveRecord::Base

	acts_as_group_member
  	acts_as_named_group_member
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :username, :presence => true, :uniqueness => true

	

	
end

class Concursante < User

	self.inheritance_column = :type

	extend FriendlyId
	friendly_id :username, use: :slugged

	acts_as_group_member
  	acts_as_named_group_member
end