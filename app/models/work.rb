class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :category, :creator, :title, :publication_year, :description, presence: true
  validates :publication_year, numericality: { only_integer: true }
  # https://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_uniqueness_of
  validates_uniqueness_of :title, scope: [:category]

  # I did not do this on my own, but instead had help from a mentor.
  # I know the directions said to use .sample then change later - 
  # but mentors sometimes do what they want! 
  def self.top_ten(type)
    category_list = Work.where(category: type)
    sorted = category_list.sort_by {|x| x.votes.length}.reverse
    ten = sorted.first(10)
    return ten
  end

end
