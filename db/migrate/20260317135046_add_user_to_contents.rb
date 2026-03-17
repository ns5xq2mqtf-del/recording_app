class AddUserToContents < ActiveRecord::Migration[7.2]
  def change
    add_reference :contents, :user, null: false, foreign_key: true
  end
end
