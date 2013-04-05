class RemoveColumnIdDecksUsers < ActiveRecord::Migration
  def change
    remove_column(:decks_users, :id)
  end
end
