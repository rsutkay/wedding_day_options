class User < ApplicationRecord
  # Direct associations

  has_one    :bus,
             :dependent => :destroy

  has_many   :song_votes,
             :dependent => :destroy

  has_many   :songs

  has_many   :ones,
             :dependent => :destroy

  has_many   :drinks

  has_many   :drink_votes,
             :dependent => :destroy

  # Indirect associations

  has_many   :votes,
             :through => :drink_votes,
             :source => :drink

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
