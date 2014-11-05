class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter


  validates :candidate, presence: true
  validates :voter, presence: true, uniqueness: true
end
