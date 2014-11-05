class API::V1::VotesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::MimeResponds

  before_filter :restrict_access_to_vote, only: [:create]

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
  def restrict_access_to_vote
    authenticate_or_request_with_http_token do |token, options|
      APIKey.exists?(access_token: token)
    end

  def vote_params
    params.require(:vote).permit(:voter, :candidate)
  end
end
