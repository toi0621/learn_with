class Genre < ApplicationRecord

    has_many :questions,  dependent: :destroy
    has_many :posts, dependent: :destroy

end
