class User < ActiveRecord::Base
  has_many :topics
  has_many :forums
  has_attached_file :avatar, :styles => {:thumb=>"75x75>", :small => "150x150>"}
  validates_presence_of :username
  validates_uniqueness_of :username
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
         
  def timeout_in
    30.minutes
  end
  
  
  acts_as_gmappable
  
  def gmaps4rails_address
    address
  end
  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :time_zone, :avatar, :imageurl, :latitude,
                  :longitude, :address, :gmaps
end
