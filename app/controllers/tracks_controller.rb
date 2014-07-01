class TracksController < ApplicationController
  def new
    @track = Track.new
  end

  def create
    bootleg = Bootleg.find(params[:bootleg_id])
    @track = bootleg.tracks.create(
      name: params[:track][:name],
      filepicker_url: params[:track][:filepicker_url]
    )
    if @track.valid?
      redirect_to bootlegs_url
    else
      render :new
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to bootlegs_path
  end
end
