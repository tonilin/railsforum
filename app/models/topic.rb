class Topic < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :board, :counter_cache => true
  belongs_to :user
  validates_presence_of :title, :content

  scope :recent, order("created_at DESC")

end
