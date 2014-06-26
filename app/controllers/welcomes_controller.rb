class WelcomesController < ApplicationController
  def show
    @upcoming_gigs = Gig.upcoming_gigs(5)
  end
end
