class Content < ApplicationRecord
    has_one_attached :content_image
    has_many :content_tag_relation
    has_many :tags, through: :content_tag_relation

    validates :title, presence: true
    validates :detail, presence: true
    validates :manufacturer, presence: true

    OPTIONS = [ "書籍", "ゲーム", "映像作品", "その他" ].freeze
    validates :genre, presence: true
    validates :genre, inclusion: { in: OPTIONS }

    scope :search_all_columns, ->(word) do
        columns = ["title", "genre", "author"]
        # .mapで配列の要素から～LIKE?文へ変形。.joinで文間にOR挿入。
        query = columns.map { |c| "#{c} LIKE ? "}.join(" OR ")
        # where(SQL文,~,~)のかたちに持ってきたい。
        where(query, *Array.new(columns.size, "%#{word}%"))
    end
end
