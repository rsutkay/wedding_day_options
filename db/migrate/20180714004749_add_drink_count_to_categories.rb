class AddDrinkCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :drinks_count, :integer
  end
end
