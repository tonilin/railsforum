class Topic < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :board, :counter_cache => true

end
