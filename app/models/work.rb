class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  validates :category, :creator, :title, :publication_year, :description, presence: true
  # https://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_uniqueness_of
  # only one of same title in each category
  validates_uniqueness_of :title, scope: [:category]

def self.winner
    @works = Work.order(:created_at)
    @works.max_by {|work| work.votes.length}
  end

  def self.top_ten(type)
    category_list = Work.where(category: type)
    sorted = category_list.sort_by {|x| x.votes.length}.reverse
    ten = sorted.first(10)
    return ten
  end
end