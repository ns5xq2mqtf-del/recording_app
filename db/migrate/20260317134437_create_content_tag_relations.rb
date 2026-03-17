class CreateContentTagRelations < ActiveRecord::Migration[7.2]
  def change
    create_table :content_tag_relations do |t|
      t.references :content, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
