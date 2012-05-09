class Topic < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true
  belongs_to :forum
  belongs_to :user
end
