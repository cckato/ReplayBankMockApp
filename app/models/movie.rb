class Movie < ActiveRecord::Base
  mount_uploader :body, MovieUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 30}
end
