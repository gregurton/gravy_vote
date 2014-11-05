module Api
  module v1
    class VotersController < ApplicationController
      before_filter :restrict_access
      respond_to :json

      # GET /voters/1
      # GET /voters/1.json
      def show
        @voter = Voter.find(params[:id])
        render json: @voter
      end

      # POST /voters
      # POST /voters.json
      def create
        @voter = Voter.new(voter_params)

        if @voter.save
          render json: @voter, status: :created, location: @voter
        else
          render json: @voter.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /voters/1
      # PATCH/PUT /voters/1.json
      def update
        @voter = Voter.find(params[:id])

        if @voter.update(voter_params)
          head :no_content
        else
          render json: @voter.errors, status: :unprocessable_entity
        end
      end

    private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
      end
    end
  end
end
