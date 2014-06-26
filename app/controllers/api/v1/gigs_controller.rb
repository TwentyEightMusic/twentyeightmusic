class Api::V1::GigsController < ApplicationController
  before_action :validate_api_key

  def create
    gig = Gig.create(gig_params)
    render json: gig
  rescue
    message = { message: "Sorry, there was an error with your request" }
    render json: message
  end

  private

  def validate_api_key
    unless ApiKey.find_by(token: params[:api_key])
      message = { message: "You are unauthorized." }
      render json: message
    end
  end

  def gig_params
    params.require(:gig_info).permit(:venue, :start_time)
  end
end
