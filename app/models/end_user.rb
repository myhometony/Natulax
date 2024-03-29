class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :only_active, -> { where(is_active: true) }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest#ゲストユーザの作成
    find_or_create_by!(
      name:"ナチュラ君",
      email:"guest@example.com",
      introduction:"どうも、ナチュラですゲコ。僕を通じて投稿の閲覧、いいね、コメントの利用ができるゲコ。（※こちらは閲覧用アカウントです）",
    ) do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.name = "ナチュラ君"
      end_user.profile_image.attach(io: File.open(Rails.root.join("app/assets/images/guest.jpeg")), filename: "guest.jpeg")
    end
  end

end
