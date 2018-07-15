class SongVote < ApplicationRecord
  # Direct associations

  belongs_to :song,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations
  
  validates :song_id, :presence => true

  validates :user_id, :presence => true
  
  validate :user_can_only_vote_one_time
  
  def user_can_only_vote_one_time
    if self.user.song_votes.count >= 1
      errors.add(:user_id, ", you only get one vote :/")
    end
  end

end
