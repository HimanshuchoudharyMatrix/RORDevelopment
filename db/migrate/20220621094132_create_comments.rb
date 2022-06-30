class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.bigint :user_id, foreign_key: true
      
      t.integer :commentable_id
      t.string :commentable_type
      #t.bigint :post_id, foreign_key: true


      t.timestamps
    end
  end
end
