class Program < ApplicationRecord
  # mount_uploader :video, Videouploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to :user
end
