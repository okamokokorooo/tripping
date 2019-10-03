class Program < ApplicationRecord
  mount_uploader :video
  belongs_to :genre
  belongs_to :user
  is_impressionable
end
