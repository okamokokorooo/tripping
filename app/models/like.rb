class Like < ApplicationRecord
  belongs_to :program, counter_cache: :likes_count
  belongs_to :user
end
