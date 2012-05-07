class Subject < ActiveRecord::Base
  has_many :forums, :dependent => :destroy
end
