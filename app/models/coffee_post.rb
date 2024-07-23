class CoffeePost < ApplicationRecord
  belongs_to :shop

  has_one_attached :coffee_image

  validates :name, presence: true, length: { maximum: 100 }
  validates :introduction, presence: true, length: { maximum: 1000 }
  validates :supplement, presence: true, length: { maximum: 1000 }

  enum brewing: { unspecified_brewing: 0, paper_drip: 1, flannel_drip: 2, french_press: 3,
                  aero_press: 4, siphon: 5, water_drip: 6, espresso_machine: 7, other_brewing: 8 }
  enum roasting: { unspecified_roasting: 0, light_roast: 1, cinnamon_roast: 2, medium_roast: 3, high_roast: 4, city_roast: 5,
                   fullcity_roast: 6, french_roast: 7, italian_roast: 8, other: 9 }
  enum grind_size: { unspecified_grind_size: 0, coarse: 1, medium_coarse: 2, medium: 3, medium_fine: 4, fine: 5, turkish: 6, other_grind_size: 7 }
  enum sweetness: { unspecified_sweetness: 0, very_sweet: 1, sweet: 2, little_sweet: 3, less_sweet: 4, not_sweet: 5 }
  enum acidity: { unspecified_acidity: 0, very_sour: 1, sour: 2, little_sour: 3, less_sour: 4, not_sour: 5 }
  enum bitterness: { unspecified_bitterness: 0, very_bitter: 1, bitter: 2, little_bitter: 3, less_bitter: 4, not_bitter: 5 }
  enum strength: { unspecified_strength: 0, high: 1, little_high: 2, strength_balanced: 3, little_low: 4, low: 5 }
  enum aftertaste: { unspecified_aftertaste: 0, sharp: 1, richness: 2, clean: 3, mellow: 4, aftertaste_balanced: 5 }

  def get_coffee_image(width, height)
    unless coffee_image.attached?
      file_path = Rails.root.join('app/assets/images/coffee_default_image.jpg')
      coffee_image.attach(io: File.open(file_path), filename: 'coffee_default_image.jpg', content_type: 'image/jpeg')
    end
    coffee_image.variant(resize_to_limit: [width, height]).processed
  end

end
