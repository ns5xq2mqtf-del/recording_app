class Tag < ApplicationRecord
    has_many :content_tag_relation
    has_many :contents, through: :content_tag_relation
    validates :name, presence: true
end
