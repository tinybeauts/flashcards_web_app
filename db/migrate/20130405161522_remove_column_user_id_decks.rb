class RemoveColumnUserIdDecks < ActiveRecord::Migration
  def change
    remove_column(:decks, :user_id)
  end
end
