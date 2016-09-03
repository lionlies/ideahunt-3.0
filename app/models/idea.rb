class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :favorites, as: :favorited
  has_many :fans, through: :favorites, source: :user
end
