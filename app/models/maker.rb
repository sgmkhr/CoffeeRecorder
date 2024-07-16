class Maker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy

  validates :company_name, presence: true, length: { maximum: 50 }
  
  GUEST_USER_EMAIL_AS_MAKER = "guest_maker@example.com"
  
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL_AS_MAKER) do |maker|
      maker.password = SecureRandom.urlsafe_base64
      maker.company_name = "guest_seller"
    end
  end
  
  def guest_maker?
    email == GUEST_USER_EMAIL_AS_MAKER
  end
end
