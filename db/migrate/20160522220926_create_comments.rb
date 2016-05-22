class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :photo_id
      t.text :body
      t.integer :user_id

      t.timestamps

    end
  end
end
