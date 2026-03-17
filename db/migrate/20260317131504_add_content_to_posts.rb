class AddContentToPosts < ActiveRecord::Migration[7.2]
  def change
    add_reference :posts, :content, null: false, foreign_key: true
  end
end
