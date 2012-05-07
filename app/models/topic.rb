class Topic < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true, :length => { :minimum => 4 }
  belongs_to :forum
  has_many :posts, :dependent => :destroy
end
