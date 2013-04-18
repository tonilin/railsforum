class Board < ActiveRecord::Base
  attr_accessible :title
  has_many :topics
  validates_presence_of :title





end
