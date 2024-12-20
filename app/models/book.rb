class Book < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :books, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true
  validates :genre, presence: true
  validates :status, presence: true
end
