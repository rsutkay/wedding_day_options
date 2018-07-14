class Artist < ApplicationRecord
  # Direct associations

  has_many   :songs,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
