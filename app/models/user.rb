class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :contents, dependent: :destroy

  has_one_attached :avatar

  def self.guest
    find_or_create_by!( email: "guest@sample.com" ) do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
