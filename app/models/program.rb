class Program < ApplicationRecord
  after_validation :geocode
  mount_uploader :video
  belongs_to :genre
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyCgU-tSZoHVCbF7MUGiRsz79eNVfKZXRrg")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
  is_impressionable
  
  validates :title, length: {maximum: 50} #50文字以下
  validates :text, length: {maximum: 1000} #1000文字以下
  # validates :

end
