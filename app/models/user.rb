class User < ActiveRecord::Base

  include  User::Roles

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable , :confirmable,:lockable, :timeoutable

  validates :username, :presence => true, :uniqueness => true, :length => { :minimum => 3}
  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 5}
  validates :first_name, :presence => true, :uniqueness => false, :length => { :minimum => 2}

  # after_save :dump_data

  mount_uploader :avatar, AvatarUploader


  def dump_data
    puts "After_save #{self.attributes}\n   errors=#{errors.inspect}"

  end

end
