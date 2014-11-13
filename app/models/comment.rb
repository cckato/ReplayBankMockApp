class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
