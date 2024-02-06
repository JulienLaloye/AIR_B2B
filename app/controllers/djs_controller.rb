class DjsController < ApplicationController
  def index
    @djs = Dj.all
  end
end
