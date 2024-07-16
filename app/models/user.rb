class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :records, dependent: :destroy

  GUEST_USER_EMAIL_AS_USER = "guest_user@example.com"
  
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL_AS_USER) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL_AS_USER
  end
end
