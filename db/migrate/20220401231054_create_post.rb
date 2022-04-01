class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :Title
      t.text :Text
      t.integer :CommentsCounter, default: 0, null: false
      t.integer :LikesCounter, default: 0, null: false
      t.timestamps
    end
  end
end
