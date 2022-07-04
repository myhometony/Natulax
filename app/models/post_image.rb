class PostImage < ApplicationRecord

  has_one_attached :image

  belongs_to :end_user
  has_many :categories, dependent: :destroy


  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :image, presence: true

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

end
