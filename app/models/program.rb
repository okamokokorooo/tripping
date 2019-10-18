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

  validates :title, length: {maximum: 50} #50文字以下
  validates :text, length: {maximum: 1000}
end
