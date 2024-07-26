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

  def get_coffee_preference_data_array
    sweetness, acidity, bitterness, strength, aftertaste = [], [], [], [], []
    records.each do |record|
      case record.rate
      when "excellent" then
        [:sweetness, :acidity, :bitterness, :strength, :aftertaste].each do |attribute|
          n = record.read_attribute_before_type_cast(attribute)
          sweetness.push(n, n, n)  if attribute == :sweetness
          acidity.push(n, n, n)    if attribute == :acidity
          bitterness.push(n, n, n) if attribute == :bitterness
          strength.push(n, n, n)   if attribute == :strength
          aftertaste.push(n, n, n) if attribute == :aftertaste
        end
      when "very_good" then
        [:sweetness, :acidity, :bitterness, :strength, :aftertaste].each do |attribute|
          n = record.read_attribute_before_type_cast(attribute)
          sweetness.push(n, n)  if attribute == :sweetness
          acidity.push(n, n)    if attribute == :acidity
          bitterness.push(n, n) if attribute == :bitterness
          strength.push(n, n)   if attribute == :strength
          aftertaste.push(n, n) if attribute == :aftertaste
        end
      when "good" then
        [:sweetness, :acidity, :bitterness, :strength, :aftertaste].each do |attribute|
          n = record.read_attribute_before_type_cast(attribute)
          sweetness.push(n)  if attribute == :sweetness
          acidity.push(n)    if attribute == :acidity
          bitterness.push(n) if attribute == :bitterness
          strength.push(n)   if attribute == :strength
          aftertaste.push(n) if attribute == :aftertaste
        end
      end
    end
    [sweetness, acidity, bitterness, strength, aftertaste].map do |data|
      (data.sum / data.length).round
    end
  end

  def get_matching_coffee_posts
    sweetness, acidity, bitterness, strength, aftertaste = self.get_coffee_preference_data_array
    CoffeePost.where(sweetness: sweetness, acidity: acidity, bitterness: bitterness, strength: strength, aftertaste: aftertaste)
  end
end
