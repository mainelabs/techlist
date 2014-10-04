class Api::V1::KindsController < Api::V1::BaseController
  def index
    render json: Kind.all
  end
end
