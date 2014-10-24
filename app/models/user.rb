class User < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  before_save { self.mail = mail.downcase }
  validates :unique_name, presence: true, length: { maximum: 20 }
  validates :name, presence:true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence:true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
end
