class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  has_and_belongs_to_many :users
end
