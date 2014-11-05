class Candidate < ActiveRecord::Base
  has_many :votes

  validates :name, presence: true
  validates :party, presence: true

  def as_json(options)
    hash = {id: id,
            name: name,
            party: party}
    # if options[:include_token]
    #   hash.merge!(token: token)
    # end

    # {candidate: hash}
  end
  # commented out code i am not sure is necessary for this particular model
end
