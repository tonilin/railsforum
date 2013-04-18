class Topic < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :board

end
