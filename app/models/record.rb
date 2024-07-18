class Record < ApplicationRecord
  belongs_to :user
  
  has_one_attached :record_image

  validates :coffee_name, presence: true, length: { maximum: 50 }
  validates :shop_name, presence: true, length: { maximum: 50 }

  enum scene: { no_scene: 0, at_shop: 1, takeout: 2, at_home: 3, outdoor: 4, other_scene: 5 }
  enum brewing: { unspecified_brewing: 0, paper_drip: 1, flannel_drip: 2, french_press: 3,
                  aero_press: 4, siphon: 5, water_drip: 6, espresso_machine: 7, other_brewing: 8 }
  enum sweetness: { unspecified_sweetness: 0, very_sweet: 1, sweet: 2, little_sweet: 3, less_sweet: 4, not_sweet: 5 }
  enum acidity: { unspecified_acidity: 0, very_sour: 1, sour: 2, little_sour: 3, less_sour: 4, not_sour: 5 }
  enum bitterness: { unspecified_bitterness: 0, very_bitter: 1, bitter: 2, little_bitter: 3, less_bitter: 4, not_bitter: 5 }
  enum strength: { unspecified_strength: 0, high: 1, little_high: 2, strength_balanced: 3, little_low: 4, low: 5 }
  enum aftertaste: { unspecified_aftertaste: 0, sharp: 1, richness: 2, clean: 3, mellow: 4, aftertaste_balanced: 5 }
  enum rate: { unspecified_rate: 0, excellent: 1, very_good: 2, good: 3, average_rate: 4, poor: 5, unacceptable: 6 }
end
