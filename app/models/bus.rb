class Bus < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations
  
  validates :passengers, :presence => true

  validates :user_id, :presence => true
  
  validate :user_can_only_ride_one_time
  
  def user_can_only_ride_one_time
    # if self.user.bus.passengers 
    #   errors.add(:user_id, ", you already entered your bus choice. If you need to revise your choice, go to 'My Selections' up top ^^")
    # end
  end


end
