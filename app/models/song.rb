class Song < ApplicationRecord
  # Direct associations

  belongs_to :artist,
             :counter_cache => true

  has_many   :song_votes,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
