class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.attachment :image
      t.text :description
      t.boolean :published

      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
