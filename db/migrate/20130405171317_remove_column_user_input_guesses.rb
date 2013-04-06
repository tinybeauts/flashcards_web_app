class RemoveColumnUserInputGuesses < ActiveRecord::Migration
  def change
    remove_column(:guesses, :user_input)
  end
end
