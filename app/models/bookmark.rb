class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_post

  validates :user_id, uniqueness: { scope: :coffee_post_id }

end