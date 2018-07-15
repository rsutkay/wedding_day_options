class DrinkVote < ApplicationRecord
  # Direct associations

  belongs_to :drink,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations
  
  validates :drink_id, :presence => true

  validates :user_id, :presence => true
  
  validate :user_can_only_vote_three_times
  
  def user_can_only_vote_three_times
    if self.user.votes.count >= 3
      errors.add(:user_id, ", you have already voted three times")
    end
  end

end
