class ArtworkSharesController < ApplicationController

  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json:artwork_share
    else
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    ArtworkShare.find(params[:id]).destroy
    render plain: 'Successfully Deleted'
  end

  private

  def artwork_share_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end

end
