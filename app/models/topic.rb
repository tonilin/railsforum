class Topic < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :board, :counter_cache => true
  validates_presence_of :title, :content

end
