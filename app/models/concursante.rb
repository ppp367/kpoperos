class Concursante < User

	self.inheritance_column = :type

	extend FriendlyId
	friendly_id :username, use: :slugged
end