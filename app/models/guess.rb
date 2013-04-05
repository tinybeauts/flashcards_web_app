class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round
  belongs_to :card
  scope :remaining, where(:correct=>false)
  validate :successful_attempt, :on=>:update

  def attempt!(answer)
    @attempt = answer
    save
  end

  def successful_attempt
    if @answer == self.card.answer
      errors.add(:attempt, "was not the answer")
    end
  end

end
