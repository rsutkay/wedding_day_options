class Drink < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :counter_cache => true

  has_many   :drink_votes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
