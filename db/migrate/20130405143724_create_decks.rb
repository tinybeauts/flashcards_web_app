class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |d|
      d.string :name
      d.references :user
    end
  end
end
