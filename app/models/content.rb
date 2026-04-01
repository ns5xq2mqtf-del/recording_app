class Content < ApplicationRecord
    has_one_attached :content_image
    has_many :content_tag_relation
    has_many :tags, through: :content_tag_relation

    accepts_nested_attributes_for :tags, reject_if: :all_blank#

    validates :title, presence: true
    validates :detail, presence: true
    validates :manufacturer, presence: true

    OPTIONS = [ "書籍", "ゲーム", "映像作品", "その他" ].freeze
    validates :genre, presence: true
    validates :genre, inclusion: { in: OPTIONS }

    scope :search_all_columns, ->(word) do
        columns = ["title", "genre", "author","detail","manufacturer"]
        # .mapで配列の要素から～LIKE?文へ変形。.joinで文間にOR挿入。
        query = columns.map { |c| "#{c} LIKE ? "}.join(" OR ")
        # where(SQL文,~,~)のかたちに持ってきたい。
        where(query, *Array.new(columns.size, "%#{word}%"))
    end

    scope :search_by_tag, ->(tag_name) {
        return if tag_name.blank?
        #tagsがﾓﾃﾞﾙ/nameがｶﾗﾑ/tag_nameが送信時の名称
        joins(:tags).where( tags: { name: tag_name }).distinct
    }

    scope :search_by_genre, ->(genre) {
        return if genre.blank?
        where(genre: genre)
    }
end
