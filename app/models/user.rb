class User < ActiveRecord::Base
  include Clearance::User
    has_many :authentications, :dependent => :destroy
    has_many :listings 
    has_many :reservations
    mount_uploaders :avatars, AvatarUploader
  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["first_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
      u.encrypted_password= SecureRandom.hex(5)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  include Clearance::User
end
