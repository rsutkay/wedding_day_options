class DrinkVote < ApplicationRecord
  # Direct associations

  belongs_to :drink,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
