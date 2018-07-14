class CreateDrinkVotes < ActiveRecord::Migration
  def change
    create_table :drink_votes do |t|
      t.integer :user_id
      t.integer :drink_id

      t.timestamps

    end
  end
end
