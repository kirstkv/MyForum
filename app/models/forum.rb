class Forum < ActiveRecord::Base
    validates :name,  :presence => true
    validates :title, :presence => true, :length => { :minimum => 4 }
    has_many :topics, :dependent => :destroy
end
