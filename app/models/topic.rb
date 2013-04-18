class Topic < ActiveRecord::Base
  attr_accessible :title, :content, :attach
  belongs_to :board, :counter_cache => true
  belongs_to :user
  validates_presence_of :title, :content

  has_attached_file :attach, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :attach,  :content_type => { :content_type => ["image/jpeg","image/png"] },  :size => { :in => 0..30.megabytes }

  scope :recent, order("created_at DESC")

end
