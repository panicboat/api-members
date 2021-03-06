# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_01_010000) do

  create_table "media", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "メディア", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.string "member_id", limit: 36, null: false, comment: "メンバーID"
    t.string "url", null: false, comment: "URL"
    t.integer "status", limit: 3, null: false, comment: "ステータス"
    t.string "note", comment: "コメント"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "fk_rails_727af2407d"
    t.index ["url"], name: "index_media_on_url", unique: true
  end

  create_table "members", id: :string, limit: 36, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "メンバー", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "name", null: false, comment: "名前"
    t.string "image", comment: "アイコン"
    t.string "note", comment: "コメント"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  add_foreign_key "media", "members"
end
