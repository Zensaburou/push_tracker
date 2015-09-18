class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }

  belongs_to :user
  has_many :events
end
