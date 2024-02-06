class DjsController < ApplicationController
  def index
  end

  def show
    @dj = Dj.find(params[:id])
  end
end
