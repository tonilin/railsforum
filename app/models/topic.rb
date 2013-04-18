class Topic < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :board, :counter_cache => true

end
