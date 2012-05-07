class Topic < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true, :length => { :minimum => 4 }
  belongs_to :forum
end
