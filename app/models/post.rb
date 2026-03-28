class Post < ApplicationRecord
    belongs_to :user
    belongs_to :content

    valitates :title, presence: true
    validates :body, presence: true
    validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_blank: true
end
