class API::V1::VotesController < ApplicationController
  # POST /api/v1/votes
  # POST /api/v1/votes.json
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:voter, :candidate)
  end
end
