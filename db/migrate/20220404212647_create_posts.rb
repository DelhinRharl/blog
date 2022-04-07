class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :text
      t.integer :Comments_counter
      t.integer :LikesCounter
     t.references :author, foregin_key: { to_table: 'users' }, index: true

      t.timestamps
    end
  end
end
