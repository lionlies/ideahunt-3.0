class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :username, uniqueness: true
  has_many :ideas, dependent: :destroy

  has_many :favorites
  has_many :favorite_ideas, through: :favorites, source: :favorited, source_type: "Idea"
end
