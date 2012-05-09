class User < ActiveRecord::Base
  has_many :topics
  has_many :forums
  has_attached_file :avatar, :styles => {:thumb=>"75x75>", :small => "150x150>"}
  validates_presence_of :username
  validates_uniqueness_of :username
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :time_zone, :avatar
end
