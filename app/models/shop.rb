class Shop < ApplicationRecord
  belongs_to :maker

  has_one_attached :shop_image

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, length: { maximu: 100 }
  validates :introduction, length: { maximum: 1000 }
  validates :website, length: { maximum: 200 }
  
  def get_shop_image(width, height)
    shop_image.variant(resize_to_limit: [width, height]).processed unless shop_image.nil?
  end
end
