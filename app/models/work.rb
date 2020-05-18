class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :category, :creator, :title, :publication_year, :description, presence: true
  validates :publication_year, numericality: { only_integer: true }
  # https://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_uniqueness_of
  validates_uniqueness_of :title, scope: [:category]

end
