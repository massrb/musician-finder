class Profile < ApplicationRecord
	has_one_attached :image
  include Parseable

  def thumbnail
    image.variant(resize_to_limit: [200, 200]).processed
  end
end
