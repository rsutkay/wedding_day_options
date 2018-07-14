class AddDrinkVoteCountToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :drink_votes_count, :integer
  end
end
