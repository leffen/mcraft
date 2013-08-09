class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable ,:token_authenticatable, :confirmable,:lockable, :timeoutable

  validates :username, :presence => true, :uniqueness => true, :length => { :minimum => 3}


end
