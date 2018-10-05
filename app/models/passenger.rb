class Passenger < ApplicationRecord
	
	has_many :passenger_bookings, dependent: :destroy
	 has_many :bookings, through: :passenger_bookings , dependent: :destroy
	 
	has_many :flights ,through: :bookings

  has_many :tickets , dependent: :destroy

	before_save   :downcase_email

  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\w\.{1}[a-z]+\z/i

  	validates :email, presence:true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
            #uniqueness: {case_sensitive: false}
  	validates :name, { presence: true, length: { maximum: 50 }}

  	private

    def downcase_email
      self.email = email.downcase
    end
end
