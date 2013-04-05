class CreateDecksUsers < ActiveRecord::Migration
  def change
    create_table :decks_users do |du|
      du.references :decks
      du.references :users
    end
  end
end
