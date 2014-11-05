class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter


  validates :candidate, presence: true
  validates :voter, presence: true, uniqueness: true

  def as_json(options)
    hash = {id: id,
            voter: voter,
            candidate: candidate}
    if options[:include_token]
      hash.merge!(token: token)
    end
    {vote: hash}
  end
end
