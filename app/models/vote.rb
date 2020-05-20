class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user
# user can vote one time on each work - prevent duplicate voting
  validates_uniqueness_of :work_id, scope: [:user_id]
end
