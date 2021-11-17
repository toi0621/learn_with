class Post < ApplicationRecord

  belongs_to :user
  
  #belongs_to :genre
  has_many :favorites, dependent: :destroy


  def favorites_by?(user)
   favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 300 }

end
