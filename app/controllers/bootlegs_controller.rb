class BootlegsController < ApplicationController
  def index
    @bootlegs = Bootleg.all
  end

  def new
    @bootleg = Bootleg.new
    @gigs = []
    gigs = Gig.sorted
    gigs.each do |gig|
      if gig.bootleg.nil?
        @gigs << gig
      end
    end
  end

  def create
    gig = Gig.find(params[:bootleg][:gig])
    @bootleg = gig.create_bootleg
    if @bootleg.valid?
      redirect_to new_bootleg_track_path(@bootleg)
    else
      render :new
    end
  end

  def destroy
    bootleg = Bootleg.find(params[:id])
    bootleg.destroy
    redirect_to bootlegs_path
  end
end
