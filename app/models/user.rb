class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :username, :presence => true, :uniqueness => true

	ROLES = %w[invitado concursante admin]

	extend FriendlyId
	friendly_id :username, use: :slugged
end
