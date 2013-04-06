class AddColumnRounds < ActiveRecord::Migration
  def change
    add_column(:rounds, :guess_total, :integer, :default => 0)
  end
end
