class RemoveColumnDeckIdUsers < ActiveRecord::Migration
  def change
    remove_column(:users, :deck_id)
  end
end
