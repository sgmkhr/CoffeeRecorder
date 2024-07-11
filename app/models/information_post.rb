class InformationPost < ApplicationRecord
  belongs_to :shop

  has_one_attached :information_image

  validates :title, presence: true, length: { maximum: 100 }
  validtaes :body, presence: true, length: { maximum: 1000 }

  def get_information_image(width, height)
    unless information_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      information_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    information_image.variant(resize_to_limit: [width, height]).processed
  end

end
