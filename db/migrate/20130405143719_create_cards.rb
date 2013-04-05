class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |c|
      c.text :question
      c.string :answer
      c.references :deck
    end
  end
end
