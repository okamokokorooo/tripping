class Program < ApplicationRecord
  mount_uploader :video
  belongs_to :genre
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  is_impressionable
end
