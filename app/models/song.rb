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
  
  validates :artist_id, :presence => true

  validates :name, :uniqueness => { :scope => [ :artist_id] }

  validates :name, :presence => true
  
  def voteSongArtist
    "#{name} by #{artist.name}" 
  end

end
