class Content < ApplicationRecord
    has_one_attached :content_image

    scope :search_all_columns, ->(word) do
        columns = ["title", "genre", "author"]
        # .mapで配列の要素から～LIKE?文へ変形。.joinで文間にOR挿入。
        query = columns.map { |c| "#{c} LIKE ? "}.join(" OR ")
        # where(SQL文,~,~)のかたちに持ってきたい。
        where(query, *Array.new(columns.size, "%#{word}%"))
    end
end
