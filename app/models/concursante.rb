class Concursante < User

	self.inheritance_column = :type

	extend FriendlyId
	friendly_id :username, use: :slugged

	#has_one :group, through: :group_membership

	acts_as_group_member
  	acts_as_named_group_member
end