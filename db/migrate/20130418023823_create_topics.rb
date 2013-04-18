class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :board_id
      t.string :title, :default => "", :nil => false
      t.string :content, :default => "", :nil => false
      t.integer :user_id
      t.timestamps
    end
  end
end
