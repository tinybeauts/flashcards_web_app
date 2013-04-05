class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |r|
      r.references :user
    end
  end
end
