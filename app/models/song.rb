class Song < ApplicationRecord
  # Direct associations

  has_many   :song_votes,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
