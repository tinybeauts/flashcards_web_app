class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_and_belongs_to_many :decks
end
