class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user
# user can vote one time on each work - prevent duplicate voting
  validates_uniqueness_of :work_id, scope: [:user_id]
  validates_uniqueness_of :user_id, scope: [:work_id]


  def self.tally_votes(work_id)
    return Vote.where(work_id: work_id).count 
  end
end
