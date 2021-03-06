class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  attachment :profile_image

  validates :name, uniqueness:true, presence: true, length: { minimum:2, maximum: 20 }
  validates :profile, length: { maximum: 50 }

  def already_favorited?(post)
   self.favorites.exists?(post_id: post.id)
  end

  def already_followed?(other_user)
   self.followings.exists?(id: other_user.id)
  end
end
