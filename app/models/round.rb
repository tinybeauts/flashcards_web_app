class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :guesses

  # after_create :pull_deck

  has_many :cards, :through => :guesses
  
  attr_accessor :choosen_deck

  # private
  # def pull_deck
  #   p "________#{self.cards.size}__________"
  #   p self.cards.size
  #   self.cards = choosen_deck.cards.to_a.shuffle
  #   p self.cards.size
  #   p "________#{self.cards.size}__________"
  # end

end
