class DjsController < ApplicationController
  def index
    @djs = Dj.all
  end

  def show
    @dj = Dj.find(params[:id])
  end
end
