class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited, polymorphic: true, counter_cache: :favorites_count
end
