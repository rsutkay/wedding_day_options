class Drink < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :counter_cache => true

  has_many   :drink_votes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :votes,
             :through => :drink_votes,
             :source => :user

  # Validations
  
  validates :category_id, :presence => true

  validates :name, :uniqueness => { :scope => [ :category_id] }

  validates :name, :presence => true

end
