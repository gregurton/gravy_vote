class API::V1::CandidatesController < ActionController::API
  # GET /api/v1/candidates
  # GET /api/v1/candidates.json
  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  # GET /api/v1/candidates/1
  # GET /api/v1/candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :party)
  end
end
