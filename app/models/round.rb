class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :guesses

  after_create :pull_deck

  has_many :cards, :through => :guesses
  
  attr_accessor :choosen_deck

  private
  def pull_deck
    self.cards = choosen_deck.cards.all.shuffle
  end

end
