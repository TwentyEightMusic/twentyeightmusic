class Api::V1::GigsController < ApplicationController
  before_action :validate_api_key

  def create
    gig = Gig.create(gig_params)
    render json: gig
  rescue
    message = { message: "Sorry, there was an error with your request" }
    render json: message
  end

  def index
    gigs = Gig.upcoming_gigs
    gigs_response = "Upcoming gigs:\n"

    gigs.each do |gig|
      gigs_response = "#{gigs_response}#{gig.listing_date}\n"
    end

    render json: { text: gigs_response }
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
