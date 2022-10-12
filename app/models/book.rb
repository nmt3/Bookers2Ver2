class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image

  def get_profile_image
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [100,100])
    else
      'no_image.jpg'
    end
  end

end
