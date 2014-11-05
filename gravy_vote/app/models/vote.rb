class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter


  validates :candidate, presence: true
  validates :voter, presence: true
  validates :voter, uniqueness: true
end
