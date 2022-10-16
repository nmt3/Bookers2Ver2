class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image


  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 200}


  def get_profile_image
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [80,80])
    else
      'no_image.jpg'
    end
  end

end
