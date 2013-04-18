class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title, :default => "", :nil => false
      t.integer :topics_count, :default => 0
      t.timestamps
    end
  end
end
