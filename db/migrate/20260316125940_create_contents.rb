class CreateContents < ActiveRecord::Migration[7.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :detail
      t.string :manufacturer
      t.string :genre
      t.string :author

      t.timestamps
    end
  end
end
