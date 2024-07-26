class Record < ApplicationRecord
  belongs_to :user

  has_one_attached :record_image

  validates :coffee_name, presence: true, length: { maximum: 50 }
  validates :shop_name, presence: true, length: { maximum: 50 }

  enum scene: { no_scene: 0, at_shop: 1, takeout: 2, at_home: 3, outdoor: 4, other_scene: 5 }
  enum brewing: { unspecified_brewing: 0, paper_drip: 1, flannel_drip: 2, french_press: 3,
                  aero_press: 4, siphon: 5, water_drip: 6, espresso_machine: 7, other_brewing: 8 }
  enum sweetness: { unspecified_sweetness: 0, not_sweet: 1, less_sweet: 2, little_sweet: 3, sweet: 4, very_sweet: 5}
  enum acidity: { unspecified_acidity: 0, not_sour: 1, less_sour: 2, little_sour: 3, sour: 4, very_sour: 5}
  enum bitterness: { unspecified_bitterness: 0, not_bitter: 1, less_bitter: 2, little_bitter: 3, bitter: 4, very_bitter: 5}
  enum strength: { unspecified_strength: 0, low: 1, little_low: 2, strength_balanced: 3, little_high: 4, high: 5}
  enum aftertaste: { unspecified_aftertaste: 0, sharp: 1, clean: 2, aftertaste_balanced: 3, mellow: 4, richness: 5}
  enum rate: { unspecified_rate: 0, excellent: 1, very_good: 2, good: 3, average_rate: 4, poor: 5, unacceptable: 6 }

  def get_record_image(width, height)
    unless record_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      record_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    record_image.variant(resize_to_limit: [width, height]).processed
  end
end
