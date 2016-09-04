class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, as: :favorited
  has_many :fans, through: :favorites, source: :user

  validates :title, length: { maximum: 30 }, presence: true
  validates :description, length: { maximum: 60 }, presence: true

end
