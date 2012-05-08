class Subject < ActiveRecord::Base
    validates :description,  :presence => true, :length => { :minimum => 4 }
    validates :title, :presence => true, :length => { :minimum => 4 }
  has_many :forums, :dependent => :destroy
end
