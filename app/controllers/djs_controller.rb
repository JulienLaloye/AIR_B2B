class DjsController < ApplicationController
  def index
    @djs = Dj.all
  end

  def show
    @dj = Dj.find(params[:id])
  end

  def new
    @dj = Dj.new
  end

  def create
    @dj = Dj.new(dj_params)
    if @dj.save
      redirect_to dj_path(@dj)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dj = Dj.find(params[:id])
  end

  def update
    @dj = Dj.find(params[:id])
    @dj.update(dj_params)
    redirect_to dj_path(@dj)
  end

  private

  def dj_params
    params.require(:dj).permit(:name, :price_per_day, :genre, :location, :capacity, :description, :picture, :user_id)
  end
end
