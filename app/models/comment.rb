class Comment < ApplicationRecord

  belongs_to :end_user
  belongs_to :post_image

  validates :text, presence: true

end
