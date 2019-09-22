class Program < ApplicationRecord
  # mount_uploader :video, Videouploader
  belongs_to :genre
  belongs_to :user
end
