class Api::V1::LinksController < ApplicationController
  def create
    link = Link.new(link_params)
    if link.save
      render json: link
    else
      render status: 400, json: {
        message: "Please enter a valid URL."
      }
    end
  end

  def index
    render json: current_user.links
  end

  def update
    render json: Link.update(params[:id], link_params)
  end

  private

  def link_params
    allowed = params.require(:link).permit(:title, :url, :user_id, :status)
  end
end
