class AddAttachColumnToTopics < ActiveRecord::Migration
  def self.up
    add_attachment :topics, :attach
  end
  def self.down
    remove_attachment :topics, :attach
  end
end
