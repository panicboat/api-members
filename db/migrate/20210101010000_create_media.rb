class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media, comment: 'メディア'  do |t|
      t.string  :name,      null: false, comment: '名前'
      t.string  :member_id, null: false, comment: 'メンバーID', limit: 36
      t.string  :url,       null: false, comment: 'URL'
      t.integer :status,    null: false,  comment: 'ステータス', limit: 3
      t.string  :note,      null: true,  comment: 'コメント'

      t.timestamps
    end
    add_foreign_key :media, :members
    add_index       :media, [:url], unique: true
  end
end
