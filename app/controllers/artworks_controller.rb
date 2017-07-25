class ArtworksController < ApplicationController
  def index
    # debugger
    render json: Artwork.all
  end

  def create
    artwork = Artwork.new(artwork_params(params))
    if artwork.save
      render json:artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json:artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end


  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params(params))
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    Artwork.find(params[:id]).destroy
  end

  private

  def artwork_params(params)
    params.require(:artwork).permit(:title, :artist_id)
  end

end
