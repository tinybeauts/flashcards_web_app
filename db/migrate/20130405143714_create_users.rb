class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :email, :password, :name
      u.integer :score, :default => 0
      u.references :deck
    end
  end
end
