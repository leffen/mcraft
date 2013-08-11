class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable ,:token_authenticatable, :confirmable,:lockable, :timeoutable

  validates :username, :presence => true, :uniqueness => true, :length => { :minimum => 3}
  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 5}
  validates :first_name, :presence => true, :uniqueness => false, :length => { :minimum => 2}



end
