class AddDrinkVoteCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :drink_votes_count, :integer
  end
end
