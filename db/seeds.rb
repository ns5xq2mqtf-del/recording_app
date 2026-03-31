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

tag_sf = Tag.create!(name: "SF")
tag_love = Tag.create!(name: "恋愛")
tag_horror = Tag.create!(name: "ホラー")
tag_history = Tag.create!(name: "歴史")
tag_action = Tag.create!(name: "アクション")
tag_violence = Tag.create!(name: "バイオレンス")
tag_comedy = Tag.create!(name: "コメディ")
tag_classics = Tag.create!(name: "古典/近代")
tag_documentary = Tag.create!(name: "ドキュメンタリー")
tag_hobby = Tag.create!(name: "趣味/教養")

# 上記ユーザの設定でContentレコード作成
Content.create!([
    { user_id: user.id, title: "山月記", detail: "詩人となる望みに敗れて虎となった男・李徴が,自分の数奇な運命を友人の袁傪に語る変身譚", manufacturer: "青空文庫", genre:"書籍", author: "中島敦", tags: [tag_classics]},
    { user_id: user.id, title: "女生徒", detail: "著者本人の日記を題材に,思春期の少女の1日を独白体で綴った短編小説。", manufacturer: "青空文庫", genre:"書籍", author: "太宰治", tags: [tag_classics] },
    { user_id: user.id, title: "不連続面", detail: "大正12年,震災の影に揺れる帝都で起こる怪奇現象を巡った一人称ホラーゲーム。", manufacturer: "liminal games", genre:"ゲーム", author: "", tags: [tag_sf, tag_horror] },
    { user_id: user.id, title: "図書館であった怖い話", detail: "図書館を舞台に様々な境遇の人の不思議な話を聞いて回るシュミレーションゲーム。", manufacturer: "三重苦", genre:"ゲーム", author: "", tags: [tag_sf, tag_horror, tag_violence] },
    { user_id: user.id, title: "0から始める中国語", detail: "発音から丁寧に寄り添い,日常で使える表現を無理なく身につけられる一冊。対応アプリ用シリアルコード付き。", manufacturer: "快哉文庫", genre:"書籍", author: "", tags: [tag_hobby] },
    { user_id: user.id, title: "物語の中のごちそう-イギリス編-", detail: "絵本や映画の中に出てきたあの食べ物を,レシピやコラムと合わせてご紹介。", manufacturer: "曙出版", genre:"書籍", author: "", tags: [tag_hobby] },
    { user_id: user.id, title: "世界路地裏名鑑", detail: "一度は訪れてみたくなる世界各地の魅力的な路地裏の資料集。", manufacturer: "曙出版", genre:"書籍", author: "", tags: [tag_hobby] },
    { user_id: user.id, title: "ハムレット", detail: "父王を毒殺され,母を奪われたデンマーク王子ハムレットの復讐譚。", manufacturer: "劇団青ザクロ", genre:"映像作品", author: "", tags: [tag_classics, tag_love]},
])

#Tag.create!([
   # { name: "SF" },
   # { name: "恋愛" },
   # { name: "ホラー" },
   # { name: "歴史" },
   # { name: "アクション" },
   # { name: "バイオレンス" },
   # { name: "コメディ" },
   # { name: "ミステリー" },
   # { name: "ドキュメンタリー" },
   # { name: "芸能/音楽" },
#])



#Content.all.each do |content|
  # ランダムに1〜3個のタグを紐付ける
  #content.tags << Tag.all.sample(rand(1..3))
#end

puts "テストデータ反映完了"
