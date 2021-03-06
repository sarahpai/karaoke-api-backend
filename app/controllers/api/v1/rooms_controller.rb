class Api::V1::RoomsController < ApplicationController
  before_action :find_room, only: :show

  def index
    @rooms = Room.all
    render json: @rooms
  end

  def show
    if @room
      render json: @room
    else
      render json: { message: "No room found" }, status: :not_found 
    end
  end

  def create
    @room = Room.create
    render json: @room
  end

  private

  def find_room
    @room = Room.find(params[:id])
  end

end
