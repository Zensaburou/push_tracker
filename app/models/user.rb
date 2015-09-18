class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_many :categories
  has_many :events, through: :categories
end
