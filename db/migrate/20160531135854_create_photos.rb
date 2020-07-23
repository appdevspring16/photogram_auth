class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :image
      t.integer :user_id

      t.timestamps

    end
  end
end
