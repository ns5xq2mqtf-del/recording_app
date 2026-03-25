# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 実行の度にデータを一度空っぽにする
Content.destroy_all
User.destroy_all

# テスト用ユーザを作成
user = User.create!(
    email: "test@example.com",
    password: "password",
    password_confirmation: "password"
)

# 上記ユーザの設定でContentレコード作成
Content.create!([
    { user_id: user.id, title: "山月記", detail: "詩人となる望みに敗れて虎となった男・李徴が、自分の数奇な運命を友人の袁傪に語る変身譚", manufacturer: "青空文庫", genre:"文芸書", author: "中島敦"},
    { user_id: user.id, title: "女生徒", detail: "著者本人の日記を題材に、思春期の少女の1日を独白体で綴った短編小説。", manufacturer: "青空文庫", genre:"文芸書", author: "太宰治" }
])
puts "新規登録完了"
