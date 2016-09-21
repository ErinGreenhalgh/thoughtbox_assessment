class Api::V1::LinksController < ApplicationController
  def create
    link = Link.new(link_params)
    if link.save
      render json: link
    else
      render_error
    end
  end

  def index
    render json: current_user.links
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      render json: link
    else
      render_error
    end
  end

  def alphabetical
    render json: current_user.links.order("lower(title)").all
  end

  private

  def render_error
    render status: 400, json: {
      message: "Please enter a valid URL."
    }
  end

  def link_params
    allowed = params.require(:link).permit(:title, :url, :user_id, :status)
  end
end
