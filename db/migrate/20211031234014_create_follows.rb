class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.bigint :follower_id, index: true, null: false
      t.bigint :followed_user_id, null: false

      t.timestamps
    end
    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followed_user_id
    add_index :follows, [:follower_id, :followed_user_id], unique: true
  end
end
