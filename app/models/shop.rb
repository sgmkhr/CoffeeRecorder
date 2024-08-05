class Shop < ApplicationRecord
  belongs_to :maker

  has_many :coffee_posts, dependent: :destroy
  has_many :information_posts, dependent: :destroy
  has_many :follows, dependent: :destroy

  has_one_attached :shop_image

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, length: { maximum: 100 }
  validates :introduction, length: { maximum: 1000 }
  validates :website, length: { maximum: 200 }

  def get_shop_image(width, height)
    unless shop_image.attached?
      file_path = Rails.root.join('app/assets/images/shop_default_image.jpg')
      shop_image.attach(io: File.open(file_path), filename: 'shop_default_image.jpg', content_type: 'image/jpeg')
    end
    shop_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(keyword)
    Shop.where(["name LIKE (?) OR introduction LIKE(?) OR address LIKE(?)", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
end
