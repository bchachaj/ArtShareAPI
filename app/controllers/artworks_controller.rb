class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    artworks = user.artworks + user.shared_artworks
    render json: artworks 
  end

  def create
    artwork = Artwork.new(artwork_params)
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

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    Artwork.find(params[:id]).destroy
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id)
  end

end
