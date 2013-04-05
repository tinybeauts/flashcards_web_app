class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |g|
      g.string :user_input
      g.boolean :correct
      g.references :round
      g.references :card
      g.timestamps
    end
  end
end
