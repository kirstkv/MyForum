class Forum < ActiveRecord::Base
    validates :name,  :presence => true
    validates :title, :presence => true, :length => { :minimum => 4 }
    has_many :topics, :dependent => :destroy
    belongs_to :subject
    belongs_to :user
    accepts_nested_attributes_for :topics
end
