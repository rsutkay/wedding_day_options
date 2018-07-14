class Drink < ApplicationRecord
  # Direct associations

  has_many   :drink_votes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
