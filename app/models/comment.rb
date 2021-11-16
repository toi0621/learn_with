class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :question

  validates :comment, presence: true

end
