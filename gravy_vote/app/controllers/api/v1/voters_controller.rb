class API::V1::VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :restrict_access_to_voter, only: [:show, :update]

  #before_filter :restrict_access<--from railscasts 352

  # GET /api/v1/voters/1
  # GET /api/v1/voters/1.json
  def show
    @voter = Voter.find(params[:id])
    render json: @voter
  end

  # POST /api/v1/voters
  # POST /api/v1/voters.json
  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter, status: :created, location: @voter
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/voters/1
  # PATCH/PUT /api/v1/voters/1.json
  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      head :no_content
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end

  private
  def restrict_access_to_voter
    authenticate_or_request_with_http_token do |token, options|
      APIKey.exists?(access_token: token)
  end

    def voter_params
      params.require(:voter).permit(:name, :party)
    end
  end
end
