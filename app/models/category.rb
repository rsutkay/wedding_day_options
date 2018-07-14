class Category < ApplicationRecord
  # Direct associations

  has_many   :drinks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
