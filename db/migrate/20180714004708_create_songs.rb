class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :artist_id
      t.string :name
      t.integer :user_id

      t.timestamps

    end
  end
end
