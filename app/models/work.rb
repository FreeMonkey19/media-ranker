class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :category, :creator, :publication_year, :description, presence: true
  validates :title, presence: true, uniqueness: true
end
