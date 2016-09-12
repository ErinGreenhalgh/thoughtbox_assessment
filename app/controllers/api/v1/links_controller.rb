class Api::V1::LinksController < ApplicationController
  def create
    byebug
    # link = Link.new(link_params)
    # byebug
    # link.user = current_user
    # link.save!
    render json: Link.create!(link_params)
  end

  private

  def link_params
    allowed = params.require(:link).permit(:title, :url, :user_id)
  end
end
