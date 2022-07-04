class Category < ApplicationRecord
  belongs_to :post_image
  validates :name, presence: true
end
