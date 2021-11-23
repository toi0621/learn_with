class Genre < ApplicationRecord

    has_many :questions
    has_many :posts

end
